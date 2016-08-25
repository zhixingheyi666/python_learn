# -*- coding: utf-8 -*- 
#创建一个可以import的读取模块，这个模块有一个读取对象
#这个对象有读取的方法，根据需要可以编写不同的方法，比如读取到屏幕，或者读取到list等
#接收一个串口实例作为基本参数，同时接收要读取的参数数量作为另外一个参数
#仅仅作为面向 对象 的一个小练习

import time
#import serial
from functools import reduce 

class read( object ):
    def __init__( self, ser ):
        self.ser = ser
        self.data = ''
        self.count = 0
#print( ser.inWaiting() )

    #r_on = input( '\n\n>按回车键结束\n>按其它任意键继续读取串口数据：\n')
    #if r_on == '':
    #    break
    def read( self, num = 1, rstr= 'rstr'):
        if self.ser.inWaiting() == 0:
            return [];
        self.data = self.ser.read( num )
        print( 'inWaiting: %r' % self.ser.inWaiting() )
        data_int = list( map( int, self.data ) )
        data_str = list( map( lambda x: '{0:0>2x}'.format( x ), data_int ) )
        print( reduce( lambda x, y: x + y, data_str ) )
        if rstr == 'rstr':
            return data_str
        return data_int

    def rd( self, num ):
        if self.count == 0:
            input( '按任意键开始循环读取串口数据：' )
#    while ser.inWaiting() >= 8:
        r_continue = 'y'
        while r_continue == 'y':
            print( 'inWaiting: %r' % self.ser.inWaiting() )
            r_continue = input( '继续读取请按y：  ' )    
            while self.ser.inWaiting() >= num:
                self.data = self.ser.read( num )
                #print( self.data )
                #将字节转换成list存储,
                    #可以设计一个数据存储格式，比如先换算成实际数值，再给数据加上信息头,比如时间，
                    #然后将数据先存储进某种形式的文件（数据编码），再设计一个读程序读取他（解码），做图表曲线什么的
                #将list转换成指定格式的16进制字符串，并输出
                data_int = list( map( int, self.data ) )
                data_str = list( map( lambda x: ' {0:0>2x}'.format( x ), data_int ) )
                print( reduce( lambda x, y: x + y, data_str, 'Line: {0:0<6d}'.format( self.count )  ) )
                #print( data_in )
                self.count += 1
