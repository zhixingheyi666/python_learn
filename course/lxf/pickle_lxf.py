# -- coding: utf-8 --

import pickle
d = dict( name = 'Bob', age = 20, score = 80 )
pd = pickle.dumps( d )
print( pd )
f = open( 'pickle_test.txt', 'wb' )
for i in range( 16 ):
    l = list( range( i ) )
    print( i )
    pickle.dump( l, f )
f.close()
f = open( 'pickle_test.txt', 'rb' )
for i in range( 16 ):
    l = pickle.load( f )
    print( l )
    
