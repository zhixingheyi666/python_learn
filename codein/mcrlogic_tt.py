# -*- coding:utf-8 -*-
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
    def fnamethash(self, fname):
        pass
    def getftime(self):
        pass
FIdisk = fh_Infolder()

f_sql = FIsql.getfname()
f_disk = FIdisk.getfname()

try:
    preDel = f_sql - f_disk
except:
    preDel = set()
predelHs = FIsql.fnamethash( preDel ) 

try:
    preAdd = f_disk - f_sql
except:
    preAdd = {} 
preadd = FIdisk.fname_hash( preAdd )

def fidMove_sql( fname, hs ):
    pass
def fidCopy_sql( fname, hs ):
    pass
def fidAdd_sql( fname, hs ):
    pass
def Del_sql( hs ):
    pass
for f_hs in preadd.items():
    if f_hs[1] in predelHs:
        fidMove_sql( *f_hs )
        predelHs.remove(f_hs[1])
    elif f_hs[1] in FIsql.gethash():
        fidCopy_sql( *f_hs )
    else:
        fidAdd_sql( *f_hs )
Del_sql( predelHs )

