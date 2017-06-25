#-*- coding:utf-8 -*-
from collections import Iterable
import os


def fRecord( content, iIter = True, fname = './tempRecord.out', cls = True ):
    if cls:
        if os.path.exists(fname) and os.path.isfile(fname):
            fsize = os.path.getsize(fname)
            if fsize > 1024 * 10:
                os.remove(fname)
    with open(fname,'a') as tf:
        if isinstance( content,Iterable ):
            if iIter:
                for ic in content:
                    tf.write(ic+'\n')
        else:
            tf.write(content)
    return cls
        #tf.write('\n==================================分割线==============================================\n')
