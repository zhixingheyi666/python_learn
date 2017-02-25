
from sys import argv
from os.path import exists
script, from_file, to_file = argv

print( 'Copying from {} to {}'.format( from_file, to_file ) )

in_file = open( from_file, encoding = 'utf-8' )
indata = in_file.read()

print( 'The input file is {} bytes long'.format( len( indata ) ) )


print( 'Does the output file exist? %r' % exists( to_file ) )
print( 'Ready, hit RETURN to continue, CTRL-C to abort.' )
input()

out_file = open( to_file, 'w' )
out_file.write( indata )

print( 'Alright, all done.' )

out_file.close()
in_file.close()
