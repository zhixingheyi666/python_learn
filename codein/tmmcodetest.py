# -*- coding:utf-8 -*-
import os,sys,time,pdb
import hashlib, chardet

from fc.LOG_sf import logger
from fc.conn_SQL import mkcon
from fc.FileFunc import GetFileHash, GetContent






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
FailCount = 0
HSdel = 0
AddOkCount = 0
McrOkCount = 0
FailList = []
FileDEL = []
FileRefresh = []

def fCheck( fname,cursor = cursor, mconn = mconn ):
    ftt = []
    for fni in fname:
        cursor.execute('''select * from fmate_code where namepath = %s''',[fni])
        ( *_, fhash, fmt, fct, _) = cursor.fetchall()[0]
        Fmt = time.strftime( '%Y-%m-%d %H:%M:%S', time.localtime(os.path.getmtime(fni)) )
        Fct = time.strftime( '%Y-%m-%d %H:%M:%S', time.localtime(os.path.getmtime(fni)) )
        if str(fmt) != Fmt or str(fct) != Fct:
            t = []
            t.append(fni)
            t.append(Fmt)
            t.append(Fct)
            nhash = GetFileHash(fni)[1]
            t.append(nhash)
            t.append(fhash)
            ftt.append(t)
    return ftt

#def fRefresh_sql( nfmate , cursor = cursor, mconn = mconn ):
    """
    更新算法：
    1、此文件名对应的hash同时有其他文件名对应，先解除旧的文件名的关联，然后直接执行全新文件的写入操作
    2、此文件名对应的hash没有其他文件名对应，先向hash_code添加新hash，再把旧hash对应的fline更新为新hash
    3、fstatus可以用于版本控制（还得配合一个历史行号和lid,历史hash的对照表，但这里先不去实现了）
            每次更新文件前，将库中hash相关的fstatus为1的全部置位为7，然后将原来所有fstatus全部减去1：
                例如：置fstatus是7的全部置为6（表示行处于等待选中的状态）
                        是0的，全部置为-1
                        是-1的，全部置为-2
            fstatus设定一个版本控制的阈值，比如-6，大于-6的行将被永久删除
            接下来执行更新新文件
                保留的行，fstatus重置为1
                新加入的行，fstatus也置为1
                删除的行（选行完毕后fstatus仍然为6），fstatus置位为0
                真正删除大于阈值的行
    4、这里先实现一个简单的：        
        update fstatus values(7,)  where hashid = fhashid and fstatus = 1 
        update fstatus values(-1,)  where hashid = fhashid and fstatus = 0 
        for li_disk in 待更新:
            li_sql = select * from fline_code where hashid = fhashid and line = li_disk.line and fstatus in (7,-1) limit1
            if li_sql == NULL:
                #全文未搜索到li_disk，视为全新的行，应当执行插入新行操作(fstatus = 1)
            elif li_sql.flid == li_disk.flid:
                #同样的行号，同样的内容，视为未更改的行，ctimestamp应当设法保持不变
                #排除sql中对照过的行 
                update fstatus values(1,) where lid = li_sql.lid
            else:
                #li_sql.flid != li_disk.flid
                #行号不一致，更新行号
                #可能的情况包括旧行删除，新行插入，旧行移动，复制插入新行等
                update flid where lid = li_sql.lid 
                #排除sql中对照过的行 
                update fstatus values(1,) where lid = li_sql.lid
        #未被选中的行，设置fstatus未上一个版本 
        update fstatus values(0,)  where hashid = fhashid and fstatus = 7 
        #仅保留上一个版本，上上个版本的行，执行删除操作
        delete fstatus   where hashid = fhashid and fstatus = -1 
        
    """
def fRefresh_sql( nfmate , cursor = cursor, mconn = mconn ):
    global FailCount
    global FileRefresh
    for nfi in nfmate:
        #print(nfi)
        cursor.execute('''use fortest;''')
        cursor.execute('''select hashid from fmate_code where namepath = %s into @oldhashid''', nfi[0:1])
        cursor.execute('''select count(namepath) from fmate_code where hashid = @oldhashid''')
        c_nfi = cursor.fetchall()[0][0]
        logger.debug('c_nfi = %r',c_nfi)
        try:
            flineargs = GetContent(nfi[0])
            #暂时：这里以文件时间判断为准，即使hash值一样，也会运行更新程序
            if nfi[3] == nfi[4]:
                cursor.execute('''select @oldhashid into @lshs''')
            else:
                cursor.execute('''insert into hash_code( strhash ) values( %s )''', nfi[3:4])
                cursor.execute('''select last_insert_id() into @lshs''')
            cursor.execute('''update fmate_code
                                set hashid = @lshs,
                                    fctime = %s,
                                    fmtime = %s
                                where namepath = %s''',nfi[-3:-6:-1])
            mconn.commit()
            if c_nfi > 1 and 0:
                cursor.executemany('''insert into fline_code( hashid, line, flid )
                                    values( @lshs, %s, %s )''', flineargs[0])
            elif c_nfi == 1:
                pdb.set_trace()
                cursor.execute('''update fline_code 
                                    set hashid = @lshs
                                    where hashid = @oldhashid ''')
                cursor.execute('''delete from hash_code where hashid = @oldhashid''') 
                cursor.execute('''update fline_code 
                                    set fstatus = 7 
                                    where hashid = @lshs and fstatus = 1''')
                cursor.execute('''update fline_code 
                                    set fstatus = -1 
                                    where hashid = @lshs and fstatus = 0''')
                mconn.commit()
                flNew = []
                flidChange = []
                for fline in flineargs:
                    cursor.execute('''select lid, line, flid 
                                        from fline_code
                                        where hashid = @lshs
                                            and fstatus in ( 7,-1 )
                                            and line = %s limit 1''', [fline[0]])
                    fli_sql = cursor.fetchall()
                    if not fli_sql:
                        pdb.set_trace()
                        flNew.append(fline)
                    elif fli_sql[0][2] == fline[1]:
                        cursor.execute('''update fline_code
                                            set fstatus = 1
                                            where lid = %s''', fli_sql[0][:1])
                    else:
                        flidChange.append( fline[1:] + (fli_sql[0][0],) )
                        cursor.execute('''update fline_code
                                                set fstatus = 1
                                                where lid = %s''', fli_sql[0][:1])
                pdb.set_trace()
                cursor.executemany('''insert into fline_code( hashid, line, flid ) values( @lshs, %s, %s )''', flNew)
                cursor.executemany('''update fline_code
                                        set flid = %s,
                                            fstatus = 1
                                        where lid = %s''', flidChange)
                cursor.execute('''update fline_code
                                        set fstatus = 0
                                        where hashid = @lshs and fstatus = 7''')
                cursor.execute('''delete from fline_code
                                        where hashid = @lshs and fstatus = -1''')
                mconn.commit()
                FileRefresh.append(nfi[0])
                logger.info('Refresh:\t%r',nfi[0])
        except:
            logger.exception('Refresh Failed:\t%s', nfi[0]) 
            logger.warn('Refresh Failed:\t%s', nfi[0]) 
            FailCount += 1
def fidAdd_sql( fname, hs, cursor = cursor, mconn = mconn):
    global FailCount 
    global AddOkCount 
    global FaiList
    #get fmtime,fctime,fcontent
    logger.debug('get fmtime,fctime,fcontent')
    fmate = []
    fmt = time.strftime( '%Y-%m-%d %H:%M:%S', time.localtime(os.path.getmtime(fname)) )
    fct = time.strftime( '%Y-%m-%d %H:%M:%S', time.localtime(os.path.getmtime(fname)) )
    fmate.append(fname)
    fmate.append(fmt)
    fmate.append(fct)
    try:
        lhs = [hs]
        flineargs = GetContent(fname)
        cursor.execute('''use fortest;''')
        cursor.execute('''insert into hash_code( strhash ) values( %s );''',lhs)
        cursor.execute('''select last_insert_id() into @lshs;''')
        cursor.execute('''insert into fmate_code( namepath, hashid, fmtime, fctime )
                            values( %s, @lshs, %s, %s );''',fmate)
        cursor.executemany('''insert into fline_code( hashid, line, flid )
                        values( @lshs, %s, %s )''', flineargs)
        mconn.commit()
        AddOkCount = AddOkCount + 1
    except:
        pdb.set_trace()
        logger.exception('Error msg')
        logger.info('fidAdd_sql--->Failed to write to Sql:\n%r',fname)
        MailCount = FailCount + 1
        FailList.append(fname)

def fidMCR_sql( fname, hs, cursor = cursor, mconn = mconn):
    logger.debug('fidMCR_sql:本函数执行移动复制重命名文件的写入')
    global FailCount 
    global McrOkCount 
    global FaiList
    #get fmtime,fctime,fcontent
    logger.debug('get fmtime,fctime,fcontent')
    fmate = []
    fmt = time.strftime( '%Y-%m-%d %H:%M:%S', time.localtime(os.path.getmtime(fname)) )
    fct = time.strftime( '%Y-%m-%d %H:%M:%S', time.localtime(os.path.getmtime(fname)) )
    fmate.append(fname)
    fmate.append(fmt)
    fmate.append(fct)
    lhs = [hs]
    try:
        #pdb.set_trace()
        cursor.execute('''use fortest;''')
        cursor.execute('''select hashid from hash_code where strhash = %s into @filehs''', lhs)
        cursor.execute('''insert into fmate_code( namepath, hashid, fmtime, fctime )
                            values( %s, @filehs, %s, %s );''',fmate)
        mconn.commit()
        logger.info('MCRing --->%r', fname)
        McrOkCount = McrOkCount + 1
    except:
        pdb.set_trace()
        logger.exception('Error msg')
        logger.info('fidMCR_sql--->Failed to write to Sql:\n%r',fname)
        MailCount = FailCount + 1
        FailList.append(fname)
def Del_sql( fname, cursor = cursor, mconn = mconn ):
    global FileDEL
    global HSdel
    ttDel = []
    try:
        cursor.execute('''use fortest;''')
        cursor.execute('''set sql_safe_updates = 0''')
        cursor.execute('''''')
        for fi in fname:
            cursor.execute('''delete from fmate_code where namepath = %s''', [fi])
            ttDel.append(fi)
        #pdb.set_trace()
        cursor.execute('''select hashid from hash_code where hashid not in (select hashid from fmate_code)''')
        #predel = [ pi[0] for pi in cursor.fetchall() ]
        predel = cursor.fetchall()
        if predel:
            cursor.executemany('''delete from fline_code 
                                    where hashid = %s''', predel)
            cursor.executemany('''delete from hash_code 
                                    where hashid = %s''', predel)
        cursor.execute('''set sql_safe_updates = 1''')
        mconn.commit()
        HSdel = len(predel)
        FileDEL = FileDEL + ttDel
        logger.info('Execute  Del_sql() Success!')
    except:
        logger.exception('Failure Of Del_sql:')
        logger.warn('FAILURE OF DEL_SQL()!')
     
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
        logger.info('返回数据库记录的完整文件名的集合')
        logger.info('Numbers of file records get from Sql: %r' % len(Fisql))
        return Fisql, len(Fisql)
    def gethash(self):
        #返回数据库记录的全部hash值
        self.cursor.execute('use fortest') 
        self.cursor.execute('select strhash from hash_code') 
        Hsisql = set()
        for hsi in self.cursor.fetchall():
            Hsisql.add( hsi[0] )
        logger.debug('返回数据库记录的全部hash值')
        logger.debug('Numbers of Hash records get from Sql: %r' % len(Hsisql))
        return Hsisql 
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
        allFiles = [] 
        Files = set()
        for root, dirs, files in os.walk( self.path ):
            for filei in files:
                fntt = os.path.join(root, filei)
                if fntt[-3:] == '.py' or fntt[-8:] == '.sf@.txt':
                    Files.add( fntt )
        #pdb.set_trace()
        logger.info('返回磁盘上需要追踪的完整文件名的集合')
        logger.info('Numbers of py and txt files get from disk: %r' % len(Files))
        return Files, len(Files)
    def fname_hash(self, fname):
        #根据给定的文件名集合，计算每个文件对应sha1，并返回一个字典类型的文件名hash map
        if isinstance( fname, set ):
            F_hs = {}
            for fni in fname:
                if os.path.isfile(fni):
                    F_hs[fni] = GetFileHash(fni)[1]
                else:
                    logger.warn('%r is NOT a file name!')
            return [ True, F_hs ]
        else:
            logger.warn('fh_Infolder.fname_hash() need an argument which type of SET!')
            return [ False, {}] 
    def getftime(self):
        pass

FIdisk = fh_Infolder('D:\\python_learn')
FIsql = fhInsql( cursor, mconn )
f_sql, fnum_sql = FIsql.getfname()
f_disk, fnum_disk = FIdisk.getfname()

try:
    preAdd = f_disk - f_sql
    preRefresh = f_disk & f_sql
    fRefresh_sql( fCheck(preRefresh) )    
    if preAdd:
        logger.debug('FIisk.fname_hash( preAdd )')
        Fname_Hash = FIdisk.fname_hash( preAdd )
        if Fname_Hash[0]:
            preadd = Fname_Hash[1]
        else:
            logger.warn('Failed to get hash of preAdd!') 
            
        HsIsql = FIsql.gethash()
        for fsh in preadd.items():
            """这里要考虑两种情形:1、文件内容已经存在，只是添加fid指向，就是所谓移动复制重命名
            #2、文件内容不存在，满足文件名和hash值同时不再数据库中
            #上面两种情况应该在数据库外用逻辑区分开，再处理
            ##添加fid:意味着向文件要素表和文件信息表写入要添加的文件名所对应的所有信息，并分配fid
            #这里传递的参数，除了包含路径的完整的文件名，还有相应的信息，我觉得每个文件可以看做一个对象
            #是文件class的一个实例。而fidAdd_sql()接收的参数就是每一个文件实例。
            """
            if fsh[1] in HsIsql: 
                fidMCR_sql( *fsh )
            else:
                fidAdd_sql( *fsh )
    logger.info( 'fnum_sql: %d', fnum_sql)
    logger.info( 'fnum_disk: %d', fnum_disk)
    logger.info( 'FailCount: %d', FailCount )
    logger.info( 'AddOkCount: %d', AddOkCount )
    logger.info( 'McrOkCount: %d', McrOkCount )
    for Fli in FailList:
        print(Fli)
    preDel = f_sql - f_disk
    Del_sql( preDel )
    logger.info( 'HSdel: %d', HSdel)
    logger.info( 'DelCount: %d', len(FileDEL))
except:
    logger.exception('Fail to run codetsql!')

