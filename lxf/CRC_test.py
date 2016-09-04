# -- coding: utf-8 --
'''
def crc16( x ):
    b = 0xA001
    print( hex( b ) )
    a = 0xFFFF
    print( hex( a ) )
    for byte in x:
        a ^= odr( byte )
        for i in range( 8 ):
'''

def crc16A(dat):
    crc=0xFFFF #65535
    index=0
    for j in dat:
        crc^=j
        #crc=crc^j
        print("crc=%x"%crc)
        for i in range(8):
            if (crc & 1)==1:
                #crc =crc >> 1
                crc >>= 1
                crc ^= 0xA001 #40961 多项式
            else:
                #crc=crc>>1
                crc >>= 1
    return crc

if __name__ == '__main__':
    import sys
    import time
    import binascii
    import datetime
    from time import gmtime, strftime

    checks_dev2='14 03 00 00 00 02' #14 03 00 00 00 02 CRC: ce c6
    #checks_dev2='01 04 13 87 00 31' #01 04 13 87 00 31 85 73
    #将字符串转成HEX数据
    checks_dev2=checks_dev2.replace(' ','')
    print( 'checks_dev2:' )
    print( checks_dev2 )
    print( type( checks_dev2 ) )
    checks_dev2bin=binascii.a2b_hex(checks_dev2.encode('ascii'))
    print( 'checks_dev2bin:' )
    print( checks_dev2bin )
    print( type( checks_dev2bin ) )
   
    ret=crc16A(checks_dev2bin)
    print("hex=%x" %(ret))
