# -*- coding: utf-8 -*-

import logging
from logging import getLogger
from logging import FileHandler 
from logging import StreamHandler 
from logging import Formatter 

#code for log
#Using:     logger.info( 'Some information' ) to replace print( 'Some information' )
logger = getLogger( 'SF' )
logger.setLevel( logging.DEBUG)
#logging.basicConfig( level = logging.INFO )

#LOG_FILE = 'JN.log'


fh = FileHandler( 'JN.log' )
#fh.setLevel( logging.INFO )
fh.setLevel( logging.DEBUG)

ch = StreamHandler()
#ch.setLevel( logging.INFO)
ch.setLevel( logging.DEBUG)
#ch.setLevel( logging.WARN)

formatter = Formatter( '%(asctime)s - %(name)s - %(levelname)s:\n%(message)s\n' )
formatter_ch = Formatter( '%(name)s:     %(message)s' )
fh.setFormatter( formatter )
ch.setFormatter( formatter_ch )

logger.addHandler(fh)
logger.addHandler(ch)

linfo = logger.info
ldebug = logger.debug

#>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

import re
from urllib import request
import urllib

from collections import deque

Sq = deque()
Vis = set()


urlst = [ "https://www.yandex.com/",
            "http://www.baidu.com",
            "http://www.1688.com",
            "https://www.zhihu.com/question/20271508",
            "http://www.cnblogs.com/wupeiqi/articles/4731930.html",
            "http://www.baidu.com/s?",
            'http://news.dbanotes.net'
            ]

Sq.append( urlst[6] )
cnt = 0
count_Sq = 1
Rurl = open( 'Result_JN_2.txt', '+w' )
Rurl.write( '\n\n' )
S = ''
while Sq:
    url = Sq.popleft()
    Vis = { url }
    count_Sq -= 1

    logger.info( ' Already Sipdered:' + str( cnt ) + '    Spidering ---->   ' + url )
    logger.info( 'Url Numbers In The Q: ' +  str(count_Sq) )
    if len( url ) > 50:
        logger.info( '>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>' )
        logger.info( url )
        continue
    try:
        Op = request.urlopen( url )
        cnt += 1
    
        if 'html' not in  Op.getheader( 'Content-Type' ):
            #sf:log >>>>add logging common
            logger.debug( 'NO html:' + url)
            continue
        try:
            Dt_t = Op.read().decode( 'utf-8' )
            Dt = Dt_t.encode( encoding = 'gbk', errors = 'backslashreplace' )
        except Exception as e:
            #sf: log
            logger.warn( 'Encode:' )
            logger.warn(e)
            continue
        Lkre = re.compile( 'href="(.+?)"' )
        Lkt =  Lkre.findall( Dt_t )   
        for x in Lkt:
            if 'http' in x and x not in Vis:
                Sq.append(x)
                Rurl.write( x + '\n' )
                count_Sq += 1
                if not count_Sq % 100:
                    S = input( 'Press N to STOP:\n' )
                logger.info( 'Adding into the Q---->  ' + x )

        if S == 'N':
            break
    except Exception as e:
        logger.error( 'urlopen:' ) 
        logger.error(e) 
        Error = input( 'Error Press:\n' )
        #sf: log    
        continue
Rurl.close()
logger.info( 'Success Commplete!' )

                    



queue = deque( [ 'Eric', 'John', 'Michael' ] )
queue.append( 'Terry' )
queue.append( 'Graham' )
queue.popleft()
queue.popleft()
queue
"""
The code below is a test for module logging.
tts = '0'
ttn = int(tts) 
logger.info( 'ttn = %d ' % ttn )
logger.debug( 'Debug:ttn = %d ' % ttn )
ldebug = logger.debug
linfo= logger.info
ldebug( 'LDB\n\n rename loggger.debug to ldebug!!' )
try:
    print( 10 / ttn )
except:
    pass
"""
