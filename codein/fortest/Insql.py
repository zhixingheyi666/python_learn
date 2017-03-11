# -*- coding:utf-8 -*-
import os,sys,time
import hashlib

from ..fc.LOG_sf import logger
from ..fc.conn_SQL import mkcon
from ..fc.GetFileHash import GetFileHash


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
cursor, mconn = mkcon()
def fidAdd_sql( fname, hs, cursor = cursor, mconn = mconn):
    #get fmtime,fctime,fcontent
    logger.info('get fmtime,fctime,fcontent')
    fmate = []
    fmt = time.strftime( '%Y-%m-%d %H:%M:%S', time.localtime(os.path.getmtime(fname)) )
    fct = time.strftime( '%Y-%m-%d %H:%M:%S', time.localtime(os.path.getmtime(fname)) )
    fmate.append(fname)
    fmate.append(fmt)
    fmate.append(fct)
    try:
        try:
            ftt = open( fname, 'r', encoding = 'utf-8' )
        except Exception as e:
            logger.exception('error msg')
            logger.debug( 'Loading file with sysdefault codepage again' )
            try:
                ftt = open( fname, 'r' )
            except Exception as e:
                logger.exception('error msg')
                logger.info( 'Fail to load file--->%s',fname )
        fcontent = ftt.readlines()
        flineargs = []
        ftti = 1
        for fci in fcontent:
            flineargs.append(( fci, ftti ))
            ftti = ftti + 1
        lhs = [hs]
        cursor.execute('''use fortest;''')
        cursor.execute('''insert into hash_code( strhash ) values( %s );''',lhs)
        cursor.execute('''select last_insert_id() into @lshs;''')
        cursor.execute('''insert into fmate_code( namepath, hashid, fmtime, fctime )
                            values( %s, @lshs, %s, %s );''',fmate)
        cursor.executemany('''insert into fline_code( hashid, line, flid )
                        values( @lshs, %s, %s )''', flineargs)
        mconn.commit()
    except:
        logger.exception('error msg')
        logger.info('Failed to write to Sql')
    finally:
        if ftt:
            ftt.close()
        
    

   
    pass

def fidMCR_sql( fname, hs ):
    pass
def Del_sql( fname ):
    pass

class fhInsql(object):
    def __init__( self, cursor, mconn, *a, **kw ):
        self.cursor = cursor
        self.mconn = mconn
    def connect(self):
        pass
    def hashtfname(self, hs):
        pass
    def fnamethash(self, fname ):
        pass
    def getfname(self):
        #返回数据库记录的完整文件名的集合
        self.cursor.execute('use fortest')
        self.cursor.execute('select namepath from fmate_code')
        Fisql = set()
        for scfi in self.cursor.fetchall():
            Fisql.add( scfi[0] )
        return Fisql

        pass
    def gethash(self):
    #返回数据库记录的全部hash值
        pass

class fh_Infolder(object):
    def __init__( self, path, **kw ):
        if os.path.isdir(path):
            self.path = path
        else:
            logger.warn("Input Error: it's not a dir!!")
            self.path = ''
    def hashtfname(self, hs):
        pass
    def getfname(self):
        #返回磁盘上需要追踪的完整文件名的集合
        Files = set() 
        for root, dirs, files in os.walk( self.path ):
            for filei in files:
                Files.add(os.path.join(root, filei))
        return Files
    def fname_hash(self, fname):
        pass
    def getftime(self):
        pass



FIsql = fhInsql( cursor, mconn )
FIdisk = fh_Infolder('D:\\python_learn')
f_sql = FIsql.getfname()
f_disk = FIdisk.getfname()
