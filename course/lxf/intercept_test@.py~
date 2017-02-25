import serial, time
com = serial.Serial( 'COM3', timeout = 0 )
i = 0
t0 = 0
r0 = 0
flag = 0
tt1 = 1
r1 = 0
print( time.clock() )
while( 1 ):
    l = com.read(1002)
    t1 = time.clock()
    r = len(l)
    if r != 0:
        tt0 = t1 - t0
        if  tt0 > 0.03 and r1 >= 18:
            print( r1 )
            if r1 != 18:
                print( '\t\t\t\t8888888888888888888888888' )
            r1 = r
        else:
            r1 += r
        t0 = t1
    else:
        i += 1
        if i // 10 == 0:
            print( i )
