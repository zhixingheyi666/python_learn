# -- coding: utf-8 --

import serial
import yd516p as yd
print( '建立虚拟端口:\t\tportAi' )
portAi = serial.Serial( 'COM3', stopbits = 2 )
print( '创建yd516仪表实例:\tyd01' )
yd01 = yd.Yd516p( 1, portAi )
dir( yd01 )
print( '尝试获取参数~~~~\t带你飞~~~' )
print( yd01.Rftime )
print( yd01.PV )
