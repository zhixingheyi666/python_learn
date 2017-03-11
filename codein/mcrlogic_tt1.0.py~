# -*- coding:utf-8 -*-
import os,sys,time
import hashlib

from fc.LOG_sf import logger
from fc.conn_SQL import mkcon


"""
fh_insql:在数据库中记录的文件名-hash值组合的集合，简称库文件
文件名-hash值组合:是判断独立文件的标志具有唯一性，文件名指的是包含路径的完整文件名
f_infolder:磁盘上实际存在的包含路径的完整文件名的集合
class fh_insql:
    connect():建立与数据库的链接
    getfname():获取数据库中文件名，返回一个集合
数据库文件记录的删除：
    先删除fid对文件内容标志hash值的指向，此时如果没有其他fid指向这个hash，则删除这个hash值指向的文件内容
"""
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

def fidAdd_sql( fname, hs ):
    #get fname,hash,fmtime,fctime,fcontent
    logger.info('get fname,hash,fmtime,fctime,fcontent')
    fmt = time.strftime( '%Y-%m-%d %H:%M:%S', time.localtime(os.path.getmtime(fname)) )
    fct = time.strftime( '%Y-%m-%d %H:%M:%S', time.localtime(os.path.getmtime(fname)) )
   
    pass
def fidMCR_sql( fname, hs ):
    pass
def Del_sql( fname ):
    pass
cursor, mconn = mkcon()

class fhInsql():
    def __init__( self, *a, **kw ):
        pass
    def connect(self):
        pass
    def hashtfname(self, hs):
        pass
    def fnamethash(self, fname ):
        pass
    def getfname(self):
        #返回数据库记录的完整文件名的集合
        pass
    def gethash(self):
    #返回数据库记录的全部hash值
        pass
FIsql = fhInsql()

class fh_Infolder():
    def __init__( self, *a, **kw ):
        pass
    def hashtfname(self, hs):
        pass
    def getfname(self):
        #返回磁盘上需要追踪的完整文件名的集合
        pass
    def fname_hash(self, fname):
        pass
    def getftime(self):
        pass
FIdisk = fh_Infolder()

f_sql = FIsql.getfname()
f_disk = FIdisk.getfname()

try:
    preAdd = f_disk - f_sql
except:
    preAdd = set() 
preadd = FIdisk.fname_hash( preAdd )

for fsh in preadd.items():
    """这里要考虑两种情形:1、文件内容已经存在，只是添加fid指向，就是所谓移动复制重命名
    #2、文件内容不存在，满足文件名和hash值同时不再数据库中
    #上面两种情况应该在数据库外用逻辑区分开，再处理
    ##添加fid:意味着向文件要素表和文件信息表写入要添加的文件名所对应的所有信息，并分配fid
    #这里传递的参数，除了包含路径的完整的文件名，还有相应的信息，我觉得每个文件可以看做一个对象
    #是文件class的一个实例。而fidAdd_sql()接收的参数就是每一个文件实例。
    """
    if fsh[1] in FIsql.gethash():
        fidMCR_sql( *fsh )
    else:
        fidAdd_sql( *fsh )

try:
    preDel = f_sql - f_disk
except:
    preDel = set()
for fi in preDel:
    Del_sql(fi)


