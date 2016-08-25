# -*- coding: utf-8 -*-

from sys import argv
import time
import serial

script, port_num, to_file = argv

out_file = open( to_file, 'a', encoding = 'utf-8' )
f_open = 1 

ser = serial.Serial( #下面这些根据实际情况修改
        port = port_num,
        baudrate = 9600,
        parity = 'N', #可选参数：serial.PARITY_EVEN , serial.PARITY_ODD, serial.PARITY_NONE,...
        stopbits = serial.STOPBITS_ONE,
        bytesize = serial.EIGHTBITS
        )

data = ''
count = 0
print( ser.inWaiting() )

while 1:
    #r_on = input( '\n\n>按回车键结束\n>按其它任意键继续读取串口数据：\n')
    #if r_on == '':
    #    break
    count1 = count
    if count == 0:
        input( '按任意键开始循环读取串口数据：' )
    while ser.inWaiting() >= 8:
        if not f_open:
            out_file = open( to_file, 'a', encoding = 'utf-8' )
            f_open = 1 
        data = ser.read( 8 )
        #print( data )
        data_in = [ int( x ) for x in bytes( data ) ] 
        #print( data_in )
        print( ' Line:  {0:<6d} {1[0]:0>2x} {1[1]:0>2x} {1[2]:0>2x} {1[3]:0>2x}\
    {1[4]:0>2x} {1[5]:0>2x} {1[6]:0>2x} {1[7]:0>2x}'\
                .format( count, data_in ) )
        out_file.write( '\n Line:  {0:<6d} '.format( count ) )
        for x in range( 8 ):
            out_file.write( '{0:0>2x} '.format( data_in[x] ) )
        count += 1
        if count%10 == 0:
            print( '\n\n' )
        #print( count )
            out_file.close()
            f_open = 0 
    if count1 == count:
        out_file.close()
        f_open = 0 


print( '谢谢使用，再见！' )
