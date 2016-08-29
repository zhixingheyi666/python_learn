# -- coding: utf-8 --

import serial, time, struct 
ser = serial.Serial( 'COM3', timeout = 3, write_timeout = 0.1 )
clock1 = time.clock() 
print( 'clock1:%s', clock1 )
i = 1
start = 0
respT = 0
avr_respT = 0
idle = 0
avr_idle = 0
addr = 1
arg = 1
while( i < 2 ):
    crc_l = 82 + addr
    crc_h = arg 
    h_addr = addr + 128 
    bys = struct.pack( '<BBBBBBBB', h_addr, h_addr, 82, arg, 0, 0, crc_l, crc_h )
    #bys *= 100
    '''
    print( bys )
    #if ser.inWaiting() == 0:
    try:
        ss = ser.write( bys )
    except  Exception: 
        print('I have cat you!') 
    #print('Go on') 
    '''
    j = 0
    while( j < 40 ):
        ss = ser.write( bys )
        start = time.clock()
        n = ser.read( 10 )
        while( ser.inWaiting() != 0 ):
            n = ser.read( 10 )
        end = time.clock()
        respT = ( end - start ) * 1000
        if respT >= 1000:
            print( '从设备丢失响应!!',j )
        else:
            avr_respT = ( ( i - 1 ) * avr_respT + respT ) / i
            print( 'respT: %02.2f' % respT )
            print( '%d\tavr_respT: %02.2f' %( j, avr_respT ) )
        print( n )
        print( len( n ) ) 
        print( '\t', j, '\t', ser.inWaiting() )
        j += 1
        #time.sleep( 0.12 )                  ###
        ''' 测试宇电516P在80ms仍然不能完全正常返回，
                主要表现为丢失响应，
                更低的时间间隔，还会有组帧错误
                在测试范围内
                平均响应时间114.55毫秒，测试数据位100组
        '''
    print( ser.inWaiting() )
    print( ser.readall() )
    print( ser.inWaiting() )
    print( ser.out_waiting ) 
    while( 1 ):
        #print( 'w' )
        print( ser.out_waiting ) 
        if ser.out_waiting == 0:
            start = time.clock()
            break
    #print( ser.readall() )
    i += 1
    time.sleep( 1 )
'''
    while( 1 ):
        #print( 'wait' )
        if ser.inWaiting() != 0:
            end = time.clock()
            ser.readall()
            break
    idle = end - start
    avr_idle = ( ( i - 1 ) * avr_idle + idle ) / i
    i += 1
    print( 'idle: %s', idle )
    print( '%d\tavr_idle: %s' %( i, avr_idle ) )
    time.sleep(1)
'''

