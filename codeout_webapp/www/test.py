# coding: utf-8

__author__ = 'Master Wang'

"""
工程测试专用代码
"""

import orm, pdb, asyncio, os, json, time
from models import User, Blog, Comment
from datetime import datetime
from aiohttp import web

#为自定义的模块添加搜索路径
import sys
sysFc = 'D:\\python_learn\\sysFc'
sys.path.append(sysFc)

from logSf10 import crLog
logger = crLog(fname = 'D:\桌面\exCodOut.log')
logger.info('Succeed')

def index(request):
    return web.Response(body = b'<h1>Code Out! Come on Baby</h1>')

@asyncio.coroutine
def init(loop):
    app = web.Application(loop = loop)
    app.router.add_route('GET', '/', index)
    srv = yield from loop.create_server(app.make_handler(), '127.0.0.1', 9999)
    logger.info('Server started at http://127.0.0.1:9999...')
    return srv

@asyncio.coroutine
def test(loop):
    yield from orm.create_pool(loop, user = 'www-data', password = 'www-data', database = 'excodout')
#    yield from orm.create_pool(loop, user = 'root', password = 'sa', database = 'spider')
#    yield from orm.create_pool(loop, user = 'root', password = 'sa', database = 'spider')
#    yield from orm.create_pool(loop, user = 'root', password = 'sa', database = 'mysql')
    u = User(name='TTet', email='RRTtest@example.com', passwd='14567890', image='about:blank')
    yield from u.save()


loop = asyncio.get_event_loop()
loop.run_until_complete(init(loop))
#loop.run_until_complete(test(loop))
loop.run_forever()

    
