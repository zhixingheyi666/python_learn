# -*- coding: utf-8 -*-

import sys
import os

"""
add the current path, and then in the scripts you shall using absolute import
tips: the scripts does not surpport relative and explicit import ??
"""
sys.path.append( os.path.abspath('..') )

"""
1,for ervery python , it has a certain "sys.path", and it decides how to write 
    the import statements. packages in parent directory also can improt( eg 1: 10 true )
    packages in which is the sub directory of  "sys.path",must use the absolute import
    or you will get error( eg 2: 2 false , eg 1: 4 false )
    2,in the other word, you can add "some path" into the "sys.path"  which contains the packages
    you need to import. 
    3,in case 'subpackage1', if you ran 'ptpython', and import directly like eg 1: 5,6
    you will get error. so in interactive mode , you can not import packages in
    parent directory.
    

eg 1:
if sys.path == 'subpackage1' (which means you ran 'ptpython' in the directory subpackage1) 
    0  false
    1  true 
    10 true 
    2  true
    3  true
    4  false 
    5  true
    6  true
    7  false
eg 2:
if sys.path == 'import_study' (which means you ran 'ptpython' in the directory import_study) 
    0  true 
    1  true
    10 true 
    2  false 
    3  false 
    4  false 
    5  true
    6  true
    7  true
"""

#0#from import_study.subpackage1.module_y import spam as ham
#1#from subpackage1.module_y import spam as ham
#10#from subpackage2.module_z import spam as ham
#2#from module_y import spam as ham
from module_y import spam as ham
#3#from subpackage_s1.module_s import spam as ham
#4#from module_s import spam as ham
#5#import subpackage2
#6#import subpackage1
#7#import import_study


#from .module_y import spam as ham
#sf: why "from ..module_a import spam as ham" can not run rightly sometimes ? 
"""
'.' means the package "subpackage1", so your sys.path[0] or os.getcwd() must 
    above the subpackage1( can not being the package itself ), or you will ger a 'top-level' error
so , if you using '..' , your "path" must above import_study.
from ..module_a import spam as ham
#from module_a import spam as ham
#from subpackage2.module_z import spam as ham
"""

def main():
    ham()

if __name__  == '__main__':
    main()
