# -- coding: utf-8 --

import serial, time
ser = serial.Serial( 'COM3' )
clock1 = time.clock() 
print( 'clock1:%s', clock1 )
i = 1
start = 0
idle = 0
avrilde = 0
while( 1 ):
    if ser.inWaiting() != 0:
        end = time.clock()
        if i == 1:
            i = 0
        else:
            idle = end - start
            print( idle )
            print( 'idle: %s', idle )
            avrilde = ( ( i - 1 ) * avridle + idle ) / i
            i += 1
        n = ser.read_all()
        start = time.clock()
        l = len(n)
        print('读取：', l )
        print( 'idle / len: %02.2f' % ( idle / l * 1000 ) )


