# -*- coding: utf-8 -*-
"""
"""
"""
生成算子全排列
    算子为+ - * / 四种运算，算式限制为三个算子，至多两层括号
"""
Camate = '+-×÷'
C_all = [ 'a' + x + 'b' + y + 'c' + z + 'd' for x in Camate for y in Camate for z in Camate]
#对每个算式生成两层以内括号的全排列，然后排除括号冗余型算式
def parentheses( formula ):
    ttFormu = [ formula ]
    ttFormu.append( (formula.replace('a', '(a')).replace('b', 'b)') )
    ttFormu.append( (formula.replace('b', '(b')).replace('c', 'c)') )
    ttFormu.append( (formula.replace('c', '(c')).replace('d', 'd)') )
    ttFormu.append( (formula.replace('a', '(a')).replace('c', 'c)') )
    ttFormu.append( (formula.replace('b', '(b')).replace('d', 'd)') )
    ttFormu.append( (((formula.replace('a', '(a')).replace('b', 'b)')).replace('c', '(c')).replace('d', 'd)') )
    ttFormu.append( ((formula.replace('a', '[(a')).replace('b', 'b)')).replace('c', 'c]') )
    ttFormu.append( ((formula.replace('a', '[a')).replace('b', '(b')).replace('c', 'c)]') )
    ttFormu.append( ((formula.replace('b', '[(b')).replace('c', 'c)')).replace('d', 'd]') )
    ttFormu.append( ((formula.replace('b', '[b')).replace('c', '(c')).replace('d', 'd)]') )
    Formu = []
    for ttFi in ttFormu:
        Fi = ''.join([ i + ' ' for i in ttFi ])
        Formu.append( Fi )
    return Formu
#生成算式矩阵：其中有64*11 = 704 个算式，其中有括号冗余需要排除
EqualMtrix = list(map(parentheses, C_all))
#算式递归解析函数，括号匹配，返回运算顺序和步骤
def analysis( formula ):
    for Iparentheses in formula:
        analysis( Iparentheses )
    """
    Make analysis to formula
    Return analysis Result
    """   
    pass
    
    
