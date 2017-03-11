# -*- coding:utf-8 -*-
import os,sys,time
import hashlib



print('Good Luck!')
def GetFileHash(fname):
    f = None;
    bRet = False;
    strSha1 = "";
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

