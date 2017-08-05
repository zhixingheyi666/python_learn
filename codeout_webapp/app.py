# coding: utf-8
"""
async web applaction
"""

import asyncio, os, json, time
from datetime import datetime

from aiohttp import web

#为自定义的模块添加搜索路径
import sys
sysFc = 'D:\\python_learn\\sysFc'
sys.path.append(sysFc)

from logSf10 import crLog
logger = crLog()
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

loop = asyncio.get_event_loop()
loop.run_until_complete(init(loop))
loop.run_forever()


