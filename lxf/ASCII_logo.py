# -- coding: utf-8 --
fpath = 'D:\\桌面\\logo\\'
print( 'Path: ', fpath)
name = input( 'Please input the File name:' )
print( name )
print( '\n' )
fname = fpath + name + '.txt'
f = open( fname, 'r' )
print( f.read() )
f.close()
