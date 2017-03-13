# -*- coding:utf-8 -*-
import os,sys,time
import hashlib
import chardet

from .LOG_sf import logger

print('Good Luck!')
def GetFileHash(fname):
    f = None
    bRet = False
    strSha1 = ""
    try:
        f = open( fname, 'rb')
        sha1 = hashlib.sha1()
        strRead = ''
        while True:
            strRead = f.read(8096)
            if not strRead:
                break
            else:
                sha1.update(strRead)
        bRet = True;
        strSha1 = sha1.hexdigest()
    except:
        bRet = False
        logger.exception()
    finally:
        if f:
            f.close()
    return [ bRet, strSha1 ]
def GetContent(fname):
        #print("Go: ftt = open( fname, 'r', encoding = 'utf-8' )")
        logger.debug("Go: ftt = open( fname, 'r', encoding = 'utf-8' )")
        logger.debug("GetContent ---> %r", fname)
        try:
            #pdb.set_trace()
            logger.debug('%r',fname)
            ftt = open( fname, 'r', encoding = 'utf-8' )
            fcontent = ftt.readlines()
        except:
            #logger.exception('error msg:    Loading file with sysdefault codepage again')
            print('error msg:    Loading file with sysdefault codepage again')
            encodett = chardet.detect( open(fname,'rb').read() )['encoding']
            try:
                #pdb.set_trace()
                ftt = open( fname, 'r', encoding = encodett )
                fcontent = ftt.readlines()
            except Exception as e:
                print('error msg: Fail to load file--->%s' % fname)
                #logger.exception('error msg')
                #logger.info( 'Fail to load file--->%s',fname )
                return 0
        finally:
            if ftt:
                ftt.close()
        flineargs = []
        ftti = 1
        for fci in fcontent:
            flineargs.append(( fci, ftti ))
            ftti = ftti + 1     
        return flineargs

        
       
