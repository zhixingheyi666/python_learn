# -*- coding:utf-8 -*-

#**kw:包含查询条件的字典，key指定列名，value是where子句的查询条件，如"regexp 'tianya'"
#函数当返回查询结果的条数，当数目过大时，看能否用fetchone()形成一个generator
#更高级的功能看能否考虑使用数据库的视图等功能实现
def sUrl( Key,  cursor = cursor, mconn = mconn, database = 'fortest', **kw ):
    pass
    
    
