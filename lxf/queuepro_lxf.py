# -- coding: utf-8 --

from multiprocessing import Queue, Process
import os, time, random

#def write( q ):
def write( mq ):
    print( 'Process to write: %s', os.getpid() )
    for value in [ 'A', 'B', 'C' ]:
        print( 'Put %s to queue...' % value )
        #q.put( value )
        mq.put( value )
        time.sleep( random.random() )


#def read( q ):
def read( mrq ):
    print( 'Process to read: %s' % os.getpid() )
    while True:
        value = mrq.get( True )
        #value = q.get( True )
        print( 'Get %s from queue.' % value )

if __name__ == '__main__':
    q = Queue()
    pw = Process( target = write, args = ( q, ) )
    pr = Process( target = read, args = ( q, ) )
    pw.start()
    pr.start()
    pw.join()
    pr.terminate()
