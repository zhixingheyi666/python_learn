# -- coding: utf-8 --

from multiprocessing import Pool  #Process       
import os, time, random

def long_time_task( name ):
    print( 'What?!!,Run task %s (%s)...' % ( name, os.getpid() ) )
    print( name )
    start = time.time()
    time.sleep( random.random() * 3 )
    end = time.time()
    print( 'Task %s runs %0.2f seconds.' % ( name, ( end - start ) ) )
    print( '%f' % ( start ) )
    print( '%f' % ( end ) )

if __name__ == '__main__':
    print( 'Parent process %s.' % os.getpid() )
    p = Pool( 8 )
    for i in range( 9 ):
        print( i )
#    p1 = Process( target = long_time_task, args = ( '1', ) )
        p.apply_async( long_time_task, args = ( i, ) )
#    time.sleep( random.random() * 5 )
    print( 'Waiting for all subprocess done ...' )
#    p1.start()
    p.close()
    p.join()
    print( 'All subprocess done.' )
