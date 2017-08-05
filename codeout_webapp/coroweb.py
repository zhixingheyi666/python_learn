# coding: utf-8

__author__ = 'Master Wang'

import sys
sysFc = 'D:\\python_learn\\sysFc'
sys.path.append(sysFc)
from logSf10 import crLog
logger = crLog()

import asyncio, os, inspect, functools

from urllib import parse
from aiohttp import web
#from apis import APIError

def get(path):
    '''
    Define decorator @get('path')
    '''
    def decorator(func):
        @functools.wraps(func)
        def wrapper(*args,**kw):
            return func(*args,**kw)
        wrapper.__method__ = 'GET'
        wrapper.__route__ = path
        return wrapper
    return decorator

def post(path):
    '''
    Define decorator @post('/path')
    '''
    def decorator(func):
        @functools.wraps(func)
        def wrapper(*args,**kw):
            return func(*args,**kw)
        wrapper.__method__ = 'POST'
        wrapper.__route__ = path
        return wrapper
    return decorator

def get_required_kw_args(fn):
    args = []
    params = inspect.signature(fn).parameters
    for name, param in params.items():
        if param.kind == inspect.Parameter.KEYWORD_ONLY and param.default == inspect.Parameter.empty:
            args.append(name)
            return tuple(args)

def get_named_kw_args(fn):
    args = []
    params = inspect.signature(fn).parameters
    for name, param in params.items():
        if param.kind == inspect.Parameter.KEYWORD_ONLY:
            args.append(name)
            return tuple(args)

def has_var_kw_args(fn):
    params = inspect.signature(fn).parameters
    for name, param in params.items():
        if param.kind == inspect.Parameter.VAR_KEYWORD:
            return True 

def has_request_args(fn):
    args = []
    sig = inspect.signature(fn)
    params = sig.parameters
    found = False
    for name, param in params.items():
        if name == 'request':
            found = True
            continue
        if found and (param.kind != inspect.Parameter.VAR_POSITIONAL and param.kind != inspect.Parameter.KEYWORD_ONLY and param.kind != inspect.Parameter.VAR_KEYWORD):
            raise ValueError('request parameter must be the last named parameter in function: %s%s' % (fn.__name__, str(sig)))
        return found

class RequestHandler(object):
    def __init__(self, app, fn):
        self._app = app
        self._func = fn
        self._has_request_arg = has_request_arg(fn) 
        self._has_var_kw_arg = has_var_kw_arg(fn) 
        self._has_named_kw_args = has_named_kw_args(fn) 
        self._named_kw_args = get_named_kw_args(fn) 
        self._required_kw_args = get_requried_kw_args(fn) 
        
    @asyncio.coroutine
    def __call__(self,request):
        kw = None
        if self._has_var_kw_arg or self._has_named_kw_args or self._required_kw_args:
            if request.method == 'POST':
                if not request.content_type:
                    return web.HTTPBadRequest('Missing Content-Type.')
                ct = request.content_type.lower()
                if ct.startswith('application/json'):
                    params = yield from request.json()
                    if not isinstance(params, dict):
                        return web.HTTPBadRequest('JSON body must be object.')
                    kw = params
                elif ct.startswith('application/x-www-form-urlencoded') or ct.startswith('multipart/form-data'):
                    params = yield from request.post()
                    kw = dict(**params)
                else:
                    return web.HTTPBadRequest('Unsupported Content-Type: %s' % request.content_type)
            if request.method == 'GET':
                qs = request.query_string
                if qs:
                    kw = dict()
                    for k,v in parse.parse_qs(qs,True).items():
                        kw[k] = v[0]
        if kw is None:
            kw = dict(**request.match_info)
        else:
            if not self._has_var_kw_arg or self._named_kw_args:
                #remove all unamed kw:
                copy = dict()
                for name in self._named_kw_args:
                    if name in kw:
                        copy[name] = kw[name]
                    kw = copy
                #check named arg:
                for k,v in request.match_info.items():
                    if k in kw:
                        logger.warning('Duplicate arg name in named arg and kw args: %s' % k)
                    kw[k] = v
        if self._has_request_arg:
            kw['request'] = request
        # check requried kw:
        if self._requried_args:
            for name in self._requried_args:
                if not name in kw:
                    return web.HTTPBadRequest('Missing argument: %s' % name)
                logger.info('call with args: %s' % str(kw))
            try:
                r = yield from self._func(**kw)
                return r
            except Exception as e:
                raise e
            #except APIerror as e:
                #return dict(error = e.error, data = e.error, message = e.message)
