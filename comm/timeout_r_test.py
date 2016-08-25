# -- coding: utf-8 --

import serial

ser = serial.Serial( 'COM3' )



data = ''
count = 0
print( ser.inWaiting() )
