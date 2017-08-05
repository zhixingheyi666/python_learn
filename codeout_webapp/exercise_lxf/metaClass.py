
# coding: utf-8

# #章节：使用元类
# 教程地址：
# https://www.liaoxuefeng.com/wiki/0014316089557264a6b348958f449949df42a6d3a2e542c000/0014319106919344c4ef8b1e04c48778bb45796e0335839000
# 参考代码地址：
# https://github.com/michaelliao/learn-python3/blob/master/samples/oop_advance/orm.py
# https://github.com/michaelliao/learn-python3/blob/master/samples/oop_advance/use_metaclass.py
# https://github.com/michaelliao/learn-python3/blob/master/samples/oop_advance/use_metaclass.py

# In[9]:


import asyncio, aiomysql
import pdb

import sys
sysFc = 'D:\\python_learn\\sysFc'
sys.path.append(sysFc)
from logSf10 import crLog
logger = crLog()



# In[10]:


class Field(object):
    #def __init__(self, name, column_type, primary_key, default):
    def __init__(self, name, column_type):
        self.name = name
        self.column_type = column_type
#      self.primary_key = primary_key
#      self.default = default
        
    def __str__(self):
#        return '<%s, %s:%s>' % ( self.__class__.__name__, self.column_type, self.name )
        return '<%s:%s>' % ( self.__class__.__name__, self.name )
    
class StringField(Field):
#    def __init__(self, name = None, primary_key = False, default = None, ddl = 'varchar(100)'):
#        super.__init__(name, ddl, primary_key, default)
    def __init__(self, name):
        super(StringField, self).__init__(name, 'varchar(100)')
        
class IntegerField(Field):
    def __init__(self, name):
        super(IntegerField, self).__init__(name, 'bigint')
        
class ModelMetaclass(type):
    def __new__(cls ,name, bases, attrs):
        #排除Model类本身
        if name == 'Model':
            return type.__new__(cls, name, bases, attrs)
        #获取table名称：
        #tableName = attrs.get('__table__', None) or name
        #logger.info('Found mode: %s (table: %s)' % (name, tableName))
        #获取所有的Field和主键名称
        mappings = dict()
        #self#我想在此处添加log代码，获取attrs以及attrs.items的真面目
        pdb.set_trace()
        for k, v in attrs.items():
            if isinstance(v, Field):
                logger.info('Found mapping: %s --> %s' % (k, v))
                mappings[k] = v
        for k in mappings.keys():
            attrs.pop(k)
        attrs['__mappings__'] = mappings #保存属性和映射的关系
        #attrs['__table__'] = tableName
        attrs['__table__'] = name #假设表名和类名一致
        # 构造默认的SELECT, INSERT, UPDATE和DELETE语句:
        #attrs['__select__'] = 'select `%s`, %s from `%s`' % (primaryKey, ','.join(escaped_fields), from tableName)
        #attrs['__insert__'] = 'insert into `%s` (%s, `%s`) values (%s)' % (tableName, ','.join(escaped_fields), primaryKey, creat_args_string(len(escaped_fields) + 1))
        #attrs['__update__'] = 'update `%s` set %s where `%s` = ?' % (tableName, ','.join(map(lambda f: '`%s` = ?' % (mappings.get(f).name or f), fields)), primaryKey)
        #attrs['__delete__'] = 'delete from %s where `%s` = ? ' % (tableName, primaryKey)
        return type.__new__(cls, name, bases, attrs)
    


# In[11]:


class Model(dict, metaclass=ModelMetaclass):

    def __init__(self, **kw):
        super(Model, self).__init__(**kw)
        #for kkw in **kw:
        #    l.append(str(kkw))
        #logger.info('%s' % str(kkw))

    def __getatttr__(self, key):
        try:
            return self[key]
        except KeyError:
            raise AttributeError(r"'Model' object has no attribute '%s'" % key)

    def __setattr__(self, key, value):
        self[key] = value

    def save(self):
        fields = []
        params = []
        args = []
        for k, v in self.__mappings__.items():
            fields.append(v.name)
            params.append('?')
            print(k)
            print('++++++++++++')
            args.append(getattr(self, k, None))
        sql = 'insert into %s (%s) values (%s)' % (self.__table__, ','.join(fields), ','.join(params))
        print('SQL: %s' % sql)
        print('ARGS: %s' % str(args))


# In[12]:


class User(Model):
    # 定义类的属性到列的映射
    #id = IntegerField('id')
    name = StringField('username')
    email = StringField('email')
    password = StringField('password')
    #这里我定义了一个测试函数，发现在modelMateclass，参数attrs果然出现了这个函数的代号
    def test():
        pass
    
# 创建一个实例:
# 初始化dict方式有两种，一种是myd = {'id':'12','name':'Micheal'}, 采用大括号加键值对方式
# 另一种是 myd = dict(id = '12', name = 'Micheal'),采用dict函数方式
# 因为User类继承自dict，所以User可以采用类似dict的初始化方法。
u = User(id = 123345, name = 'Michael', email = 'test@orm.org', password = 'mypass')

if __name__ == '__main__':
    ut = User(id = 1235, name = 'Richael', email = 'mytest@orm.org', password = 'passmy')

