# -*- coding: utf-8 -*-
#写一个通用的 日志 函数，返回一个日志实例
#函数的作用就是通过传递参数来定制个性化的 日志实例，精细的控制日志行为来满足需要
#比如多久日志清空一次，日志的路径等等
#默认参数包括日志的名称和路径，是否启用文件日志，日志标志符等
#当然，是否可以通过自定义 logging.Logger 类,来实现同样的功能，测试一下看看

import logging, os
from logging import getLogger
from logging import FileHandler 
from logging import StreamHandler 
from logging import Formatter 

import pdb

defaultFname = 'D:\桌面\Log-test_I.log'

def setLevel(level, obj):
    info = 'Set level'
    if level == 'DEBUG':
        obj.setLevel( logging.DEBUG)
    elif level == 'INFO':
        obj.setLevel( logging.INFO)
    elif level == 'WARNING':
        obj.setLevel( logging.WARNING)
    elif level == 'ERROR':
        obj.setLevel( logging.ERROR)
    else:
        obj.setLevel( logging.DEBUG)
        info = 'param "level: %r" is not suitable for function crLog!\nthe logging level will be set as DEBUG!\nlevel could be DEBUG, INFO, WARNING, ERROR \n\n' % level
    return info 

  

def crLog(level = ('DEBUG','DEBUG','INFO'), fname = defaultFname , head = 'SF', ifile = True, cls = False):
#get a Logger instance
    logger = getLogger(head)
    info = setLevel(level[0], logger)
    logger.warning(info)
    if len(info) < 16:
        logger.warning('%r ----> Basic log level\n' % level[0])
    #判定相应的handlers是否已经存在，避免重复添加
    handlers = logger.handlers
    mkhF = True 
    mkhS = True 
    if handlers:
        for ih in handlers:
            if isinstance(ih,FileHandler):
                if ih.baseFilename == fname:
                    mkhF = False
            elif isinstance(ih,StreamHandler):
                    mkhS = False
            else:
                continue
    #config the instance
    #set log file 
    if ifile:
        if cls or fname == 'D:\桌面\Log-test.log':
            #取最后300行后，删除文件，重建新文件，插入最后300行
            if os.path.exists(fname) and os.path.isfile(fname):
                fsize = os.path.getsize(fname)
                if fsize > 1024 * 10:
                    os.remove(fname)
        if mkhF:
            fh = FileHandler(fname)
            info = setLevel(level[1], fh)
            logger.warning(info)
            if len(info) < 16:
                logger.warning('%r ----> Log FileHandler\n' % level[1])
            formatter = Formatter( '%(asctime)s - %(name)s - %(levelname)s:\n%(message)s\n' )
            fh.setFormatter( formatter )
            logger.addHandler(fh)
    if mkhS:
        ch = StreamHandler()
        info = setLevel(level[2], logger)
        logger.warning(info)
        if len(info) < 16:
            logger.warning('%r ----> Log StreamHandler\n' % level[2])
        formatter_ch = Formatter( '%(name)s:     %(message)s' )
        ch.setFormatter( formatter_ch )
        logger.addHandler(ch)
        logger.info("Using ---> crLog(level = ('DEBUG','DEBUG','INFO'), fname = %r, head = 'SF', ifile = True, cls = False)\n\n" % defaultFname)
    return logger

"""
The code below is a test for module logging.
"""
if __name__ == '__main__':
    tts = '0'
    ttn = int(tts) 
    logger = crLog( level = ['DEBUG','DEBUG','DEBUG'], head = 'logger:' )
    #logger = crLog( level = ['WARNING','INFO','def'], head = 'TEST:' )
    #logger = crLog( level = ['def','INFO','WARNING'], head = 'TEST:' )
    logger.info( 'ttn = %d ' % ttn )
    logger.debug( 'Debug:ttn = %d ' % ttn )
    logger.warning( 'WARNING!!' )
    ldebug = logger.debug
    linfo = logger.info
    linfo( 'LDB\nRename loggger.debug to ldebug!!' )
    try:
        print( 10 / ttn )
    except Exception as e:
        ldebug( e )
    loggerI = crLog( level = ['DEBUG','DEBUG','DEBUG'], head = 'loggerI:' )
    loggerI.info( 'ttn = %d ' % ttn )
    loggerI.debug( 'Debug:ttn = %d ' % ttn )
    loggerI.warning( 'WARNING!!' )
