
# coding: utf-8

__author__ = 'Master Wang'

import asyncio, aiomysql, pdb
import sys
sysFc = 'D:\\python_learn\\sysFc'
sys.path.append(sysFc)
from logSf10 import crLog
logger = crLog(fname = 'D:\桌面\exCodOut.log')
#logger = crLog(fname = 'D:\桌面\orm.log')
#from logSf10 import logger 
#logger = logger 


def log(sql, args = ()):
    logger.info('SQL: %s' % sql)

# In[3]:


@asyncio.coroutine
def create_pool(loop, **kw):
    logger.info('Create database connction pool...')
    global __pool
    #pdb.set_trace()
    __pool = yield from aiomysql.create_pool(
        #host = kw.get('host','127.0.0.1'),
        host = kw.get('host','localhost'),
        port = kw.get('port',3306),
        user = kw['user'],
        password = kw['password'],
        db = kw['database'],
        charset = kw.get('charset','utf8'),
        autocommit = kw.get('autocommit',True),
        maxsize = kw.get('maxsize',10),
        minsize = kw.get('minsize',1),
        loop = loop
    )

@asyncio.coroutine
def select( sql, args, size = None):
    log(sql, args)
    global __pool
    with (yield from __pool ) as conn:
        cur = yield from conn.cursor( aiomysql.DictCursor )
        yield from cur.execute(sql.replace('?', '%s'), args or ())
        if size:
            rs = yield from cur.fetchmany(size)
        else:
            rs = yield from cur.fetchall()
        yield from cur.close()
        logger.info('Rows returned: %s' % len(rs))
        return rs

@asyncio.coroutine
def execute(sql, args, autocommit = True):
    log(sql)
    with (yield from __pool) as conn:
        if not autocommit:
            yield from conn.begin()
        try:
            cur = yield from conn.cursor(aiomysql.DictCursor)
            yield from cur.execute(sql.replace('?', '%s'), args)
            affected = cur.rowcount
            if not autocommit:
                yield from cur.commit()
            #yield from cur.colse()
        except BaseException as e:
            if not autocommit:
                yield from cur.rollback()
            raise
        return affected

def create_args_string(num):
    L = []
    for n in range(num):
        L.append('?')
    return ','.join(L)

class Field(object):
    def __init__(self, name, column_type, primary_key, default):
        self.name = name
        self.column_type = column_type
        self.primary_key = primary_key
        self.default = default
        
    def __str__(self):
        return '<%s, %s:%s>' % ( self.__class__.__name__, self.column_type, self.name )
    
class StringField(Field):
    def __init__(self, name = None, primary_key = False, default = None, ddl = 'varchar(100)'):
        super().__init__(name, ddl, primary_key, default)
    
class BooleanField(Field):
    def __init__(self, name = None, default = False):
        super().__init__(name, 'boolean', False, default)
    
class IntegerField(Field):
    def __init__(self, name = None, primary_key = False, default = 0):
        super().__init__(name, 'bigint', primary_key, default)
    
class FloatField(Field):
    def __init__(self, name = None, primary_key = False, default = 0.0):
        super().__init__(name, 'real', primary_key, default)
    
class TextField(Field):
    def __init__(self, name = None, default = False):
        super().__init__(name, 'text', False, default)
        
class ModelMetaclass(type):
    def __new__(cls ,name, bases, attrs):
        #排除Model类本身
        if name == 'Model':
            return type.__new__(cls, name, bases, attrs)
        #获取table名称：
        tableName = attrs.get('__table__', None) or name
        logger.info('Found mode: %s (table: %s)' % (name, tableName))
        #获取所有的Field和主键名称
        mappings = dict()
        fields = []
        primaryKey = None
        for k, v in attrs.items():
            if isinstance(v, Field):
                logger.info('Found mapping: %s --> %s' % (k, v))
                mappings[k] = v
                if v.primary_key:
                    #找到主键：
                    if primaryKey:
                        raise RuntimeError('Duplicated primary key for field: %s' % k)
                    primaryKey = k
                else:
                    fields.append(k)
        if not primaryKey:
            raise RuntimeError('Primary key not found.')
        for k in mappings.keys():
            attrs.pop(k)
        escaped_fields = list(map(lambda f: '`%s`' % f, fields))
        attrs['__mappings__'] = mappings #保存属性和映射的关系
        attrs['__table__'] = tableName
        attrs['__primary_key__'] = primaryKey #主键属性名
        attrs['__fields__'] = fields #除主键外的属性名
        # 构造默认的SELECT, INSERT, UPDATE和DELETE语句:
        attrs['__select__'] = 'select `%s`, %s from `%s`' % (primaryKey, ','.join(escaped_fields), tableName)
        attrs['__insert__'] = 'insert into `%s` (%s, `%s`) values (%s)' % (tableName, ','.join(escaped_fields), primaryKey, create_args_string(len(escaped_fields) + 1))
        attrs['__update__'] = 'update `%s` set %s where `%s` = ?' % (tableName, ','.join(map(lambda f: '`%s` = ?' % (mappings.get(f).name or f), fields)), primaryKey)
        attrs['__delete__'] = 'delete from %s where `%s` = ? ' % (tableName, primaryKey)
        return type.__new__(cls, name, bases, attrs)
    
class Model(dict,metaclass = ModelMetaclass):
    def __init__(self, **kw):
        super(Model, self).__init__(**kw)
        
    def __getattr__(self,key):
        try:
            return self[key]
        except KeyError:
            raise AttributeError(r"'Model' has no attribute %s" % key)
            
    def __setattr__(self, key, value):
        self[key] = value
        
    def getValue(self, key):
        """
        现在已经建立了程序按行入库的框架，因此我组织程序的方式可以有新的变革
            例如，在程序中插入类似xml的标签或者id，以实现某些搜索或标记的需求或新功能
            这里，我想提示自己稍后详细研究下函数getattr，我就可以标记如下：
            #梗#稍后研究下面的 getattr
        """
        return getattr(self,key,None)
    
    def getValueOrDefault(self,key):
        value = getattr(self,key,None)
        if value is None:
            field = self.__mappings__[key]
            if field.default is not None:
                value = field.default() if callable(field.default) else field.default
                logger.info('Using default value for %s: %s' % (key, str(value)))
                setattr(self,key,value)
        return value

    @classmethod
    @asyncio.coroutine
    def findAll(cls, where = None, args = None, **kw):
        'find objects by where clause.'
        sql = [cls.__select__]
        if where:
            sql.append('where')
            sql.append(where)
        if args is None:
            args = []
        orderBy = kw.get('orderBy',None)
        if orderBy:
            sql.append('order by')
            sql.append(orderBy)
        limit = kw.get('limit',None)
        if limit is not None:
            sql.append('limit')
            if isinstance(limit, int):
                sql.append('?')
                args.append(limit)
            elif isinstance(limit, tuple) and len(limit) == 2:
                sql.append('?, ?')
                args.extend(limit)
            else:
                raise ValueError('Invalid limit value: %s' % str(limit))
        rs = yield from select(' '.join(sql), args)
        #梗#弄清cls(**r)是什么用法
        return [cls(**r) for r in rs]

    @classmethod
    @asyncio.coroutine
    def findNumber(cls, selectField, where = None, args = None):
        'find number by selected and where'
        #梗#`%s`是什么用法
        sql = ['select %s _num_ from `%s`' % (selectField, cls.__table__)]
        if where:
            sql.append('where')
            sql.append(where)
        rs = yield from select(' '.join(sql), args, 1)
        if len(rs) == 0:
            return None
        return rs[0]['_num_']
    
    @classmethod
    @asyncio.coroutine
    def find(cls, pk):
        #find object by primary key.
        rs = yield from select('%s where `%s` = ?' % (cls.__select__, cls.__primary_key__), [pk], 1)
        if len(rs) == 0:
            return None
        return cls(**rs[0])
    
    @asyncio.coroutine
    def save(self):
        args = list(map(self.getValueOrDefault,self.__fields__))
        args.append(self.getValueOrDefault(self.__primary_key__))
        rows = yield from execute(self.__insert__,args)
        if rows != 1:
            logger.warn('Failed to insert record: affected rows: %s' % rows)
    
    @asyncio.coroutine
    def update(self):
        args = list(map(self.getValueOrDefault,self.__fields__))
        args.append(self.getValueOrDefault(self.__primary_key__))
        rows = yield from execute(self.__update__,args)
        if rows != 1:
            logger.warn('Failed to update by primary key: affected rows: %s' % rows)

    @asyncio.coroutine
    def remove(self):
        args = [self.getValue(self.__primary_key__)]
        rows = yield from execute(self.__delete__, args)
        if rows != 1:
            logger.warn('Failed to remove by primary_key: affected rows: %s' % rows)

    
    
#self#此处用作测试用
class User(Model):
    # 定义类的属性到列的映射
    __table__ = 'users'
    id = IntegerField('id',True)
    name = StringField('username')
    email = StringField('email')
    password = StringField('password')
    #这里我定义了一个测试函数，发现在modelMateclass，参数attrs果然出现了这个函数的代号
    def test():
        pass

if __name__ == '__main__':
    ut = User(id = 1235, name = 'Richael', email = 'mytest@orm.org', password = 'passmy')
    


# User类现在就可以通过类方法实现主键查找：
# user = yield from User.find('123')
# 
# 这样，就可以把一个User实例存入数据库：
# user = User(id=123, name='Michael')
# yield from user.save()
