# -*- coding: utf-8 -*-

import time
from ptpython.repl import embed


print('Now at mprint.py     >>>>>>>>>>>>>>>>>>>>>>>>>')
L = list( map( chr, range( ord('a'), ord('z') + 1) ) )
print( L )
print( 'L[-3 : -10: -1]:', L[-3 : -10: -1] )
print( 'L[-3 : -10: -2]:', L[-3 : -10: -2] )
embed( globals(), locals() )
