# -*- coding: utf-8 -*-
import os
import sys
#import readline
#import ConfigParser
#from optparse import OptionParser

#s.communicate 会一直等到子进程结束，阻塞式。
#python 加上 -i，s.poll()会一直得不到返回值，直到子进程结束，返回值为 0
#如果subprocess 用 python -i 的交互模式，stdout默认输出到shell交互界面，即使指向文件，也无效
#subprocess，communicate 和 stdin的用途和区别，需要搞清楚就可以,问题的关进还是在于 “交互！！”
#如果用 s.kill()，则s.poll()的值为1
import subprocess
import time
import random

#cmd = 'ls'
#cmd = 'python  mprint.py'
cmd = 'python -i mprint.py'
#cmd = 'python -i '
#s = subprocess.Popen( cmd, stdin = subprocess.PIPE )
#s = subprocess.Popen( cmd, shell = True, stdin = subprocess.PIPE, stdout = subprocess.PIPE )
arin = open( 'args_tmp.txt', 'rt' )

tmpf = './out%d.tmp' % random.randint(1000,9999)
out_w= open( tmpf, 'wt' )
s = subprocess.Popen( cmd, stdin = subprocess.PIPE, stdout = out_w )
words = arin.readline()
print(words)
while words != 'N':
    words = input('Press N to qiut:')
    if words == 'M':
        s.stdin = 'M'
    print( 'your input:',words )
out_w.close()
#print(s.stdout.readlines())

