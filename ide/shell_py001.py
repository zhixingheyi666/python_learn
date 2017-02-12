# -*- coding: utf-8 -*-
import os
import sys
#import readline
#import ConfigParser
#from optparse import OptionParser
import subprocess
import time

#cmd = 'ls'
cmd = 'python'
s = subprocess.Popen( cmd, shell = True, stdin = subprocess.PIPE, stdout = subprocess.PIPE )
#s = subprocess.Popen( cmd, shell = True, stdin = subprocess.PIPE, stdout = subprocess.PIPE )

if input( 'Press N to quit:\n' ) == 'N':
    print('import完毕，可否实现交互输入输出?同时主程序也并行运行？')
def pf():
    print( c for c in list(map( chr, range( ord('a'),ord('z') + 1 ) )  ))
print('Goodluck!')
