import time
import serial

ser = serial.Serial( #下面这些参数根据情况修改
    port = 'COM4',
    baudrate = 9600,
    #parity = serial.PARIYT_ODD,
    stopbits = serial.STOPBITS_TWO,
    bytesize = serial.EIGHTBITS,
    timeout = 5
    )
data = ''
ser.write( b'\xe4\xb8\xad' )
while ser.inWaiting() > 0:
    data += ser.read(1)
if data != '':
    print ( data )

