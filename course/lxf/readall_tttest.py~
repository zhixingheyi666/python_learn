import serial, time
com = serial.Serial( 'COM3', timeout = 0 )
while( 1 ):
    l = com.readall()
    #time.sleep(0.018)
    if l != b'':
        print( len(l) )
