import serial
ser = serial.Serial( #下面这些参数根据情况修改
        port =  'COM5',
        baudrate = 9600,
        parity = serial.PARITY_ODD,
        stopbits = serial.STOPBITS_TWO,
        bytesize = serial.EIGHTBITS,
        )
data = b''
i = input( '输入按字节读取次数(后面的设定为文本模式下，每次读取5个字符)：' )
j = int( i )
print( j )
while j > 0:
    data += ser.read(5)
    print(data)
    j = j - 1
    print( j )
if data != '':
    print(data)
#while ser.inWaiting() > 0:
#    data += ser.read(1)
#if data != '':
#    print(data)
