# -- coding: utf-8 --

from multiprocessing import Process       #Pool
import os, time, random

def long_time_task( name ):
    print( 'Run task %s (%s)...' % ( name, os.getpid() ) )
    print( name )
    start = time.time()
    time.sleep( random.random() * 3 )
    end = time.time()
    print( 'Task %s runs %0.2f seconds.' % ( name, ( end - start ) ) )
    print( '%f' % ( start ) )
    print( '%f' % ( end ) )

if __name__ == '__main__':
    print( 'Parent process %s.' % os.getpid() )
#    p = Pool( 4 )
    prol = []
    for i in range( 5 ):
        print( i )
#        prol.append( i ** i ) ##Process( target = long_time_task, args = ( '1', ) ) )
        prol.append( Process( target = long_time_task, args = ( i, ) ) )
        print( type( prol[ -1 ] ) )
        print( prol )
#        prol[ -1 ].start
#        p.apply_async( long_time_task, args = ( i, ) )
    print( 'Waiting for all subprocess done ...' )
    print( prol )
    for i in range( 5 ):
        prol[ i ].start()

    for i in range( 5 ):
        prol[ i ].join()
#    Process-1.start()
#    Process-1.join()
#    p1.join()
#    p.close()
#    p.join()
    print( 'All subprocess done.' )

