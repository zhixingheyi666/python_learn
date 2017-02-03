# -*- coding:utf-8 -*-

import logging
import sys


# 获取logger实例，如果参数为空则返回root logger
logger = logging.getLogger()
print(logger)

# 指定logger输出格式
formatter = logging.Formatter( '%(asctime)s %(levelname)-8s: %(message)s' )

#文件日志
file_handler = logging.FileHandler('test.log')
file_handler.setFormatter(formatter) #可以通过setFormatter指定输出格式

#控制台日志
console_handler = logging.StreamHandler(sys.stdout)
console_handler.formatter = formatter #也可以直接给formatter赋值

#为logger添加日志处理器
logger.addHandler(file_handler)
logger.addHandler(console_handler)

#指定日志的最低输出级别，默认为waring级别
logger.setLevel(logging.DEBUG)

L = []
L = list( range( 101 ) )
print( L )
print( L[::-3] )
L.append('A')
try:
    L.sort()
except:
    pass


#输出不同级别的log
logger.debug( 'This is DEBUG info.' )
logger.info( 'This is INFORMATION.' )
logger.warn( 'This is WARNINF message.' )
logger.error( 'This is error message.' )
logger.fatal( 'This is fatal message, it is same as logger.critical' )
logger.critical( 'This is critical message' )
