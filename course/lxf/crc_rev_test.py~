# -- coding: utf-8 --
import time
import struct

def crc( rev ):
    rev = struct.unpack( 'BBBBbBBBBB', rev ) 
    #rev = struct.unpack( 'BBBBBBBBBB', rev ) 
    addr = 1
    print( rev )
    vlist = []
    vlist.append( rev[6] + rev[7] * 256 )
    vlist.append( time.time() )
    vlist.append( rev[0] + rev[1] * 256 )
    vlist.append( rev[2] + rev[3] * 256 )
    vlist.append( rev[4] )
    vlist.append( rev[5] )
    mk_crc = vlist[2] + vlist[3] + vlist[5] * 256 + vlist[4] + vlist[0] + addr
    for i in [ 0, 2, 3 ]:
        if vlist[i] >= 32768:
            vlist[i] -= 65536
    crc = rev[8] + rev[9] *256
    print( vlist )
    #mk_crc = vlist[2] + vlist[3] + vlist[5] * 256 + vlist[4] + vlist[0] + addr
    print( 'crc',crc,'mk_crc',mk_crc%65536 )
    if crc == mk_crc % 65536:
        print('Success!')
        return vlist
    else:
        print('Failure!')
        return -1       ##temp:临时段，错误处理.
## C3 00 1E FD 00 60 00 7D E2 DA
rev2 = b'\xC6\x00\xFE\x00\x1D\x60\x00\x7D\xE2\xDE'
rev3 = b'\xC6\x00\xFE\x00\x80\x60\x00\x7D\xE2\xDE'
rev4 = b'\xC6\x00\xFE\x00\xfa\x60\x00\x7D\xE2\xDE'
rev = b'\xc3\x00\x1e\xfd\x00`\x00}\xe2\xda'
