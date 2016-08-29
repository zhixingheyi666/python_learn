# -- coding: utf-8 --
import struct
import time

class Aibus( object ):

    def __init__( self, port, baudrate, rtimeout):
        self.port = port
        self.comattr = ( 'Aiv80_00',
                            {   #'port': 'COM3',
                                #'baudrate': 9600, 
                                'bytesize': 8, 
                                'parity': 'N', 
                                'stopbits': 2,
                                'timeout': None,
                                'xonxoff': False, 
                                'rtscts': False,
                                'dsrdtr': False,   
                                'doc': '厦门宇电温控仪AI协议V80版，port设定：00验证版'
                                }
                        )
        #if self.port.comattr != self.comattr[0]:
            #set给实例“port绑定不匹配错误”标志
        self.port.baudrate = baudrate  ##并未测试当串口打开时，是否立即生效
        self.port.timeout = rtimeout
        self.wtimeout = 0.015           ##时间=11*10*2/9600*1000 = 11.5毫秒。包括停止位11bit，协议最大收发帧10字节。 假设每发送一字节，空闲一字节。
    def write( self, bys ):
        ##发送之前，清空发送和接收缓冲区
        #self.port.reset_input_buffer
        #self.port.reset_output_buffer
        #print( 'Ttest!!', self.port , dir( self.port ))
        self.port.write( bys )
        ##可以读取发送状态，判断是否成功发送，或者返回相应的错误信息
        
        pass
    def receive( self, addr ):
        rev = self.port.read( 10 )
        if len( rev ) == 10:
            rev = struct.unpack( 'BBBBbBBBBB', rev ) 
            vlist = []
            vlist.append( rev[6] + rev[7] * 256 )
            vlist.append( time.time() )
            vlist.append( rev[0] + rev[1] * 256 )
            vlist.append( rev[2] + rev[3] * 256 )
            vlist.append( rev[4] )
            vlist.append( rev[5] )
            for i in [ 0, 2, 3 ]:
                if vlist[i] >= 32768:
                    vlist[i] -= 65536
            crc = rev[8] + rev[9] *256
            mk_crc = vlist[2] + vlist[3] + vlist[5] * 256 + vlist[4] + vlist[0] + addr
            if crc == mk_crc % 65536:
                return vlist
            else:
                return -1       ##temp:临时段，错误处理.
        else:
            return -1           ##temp:临时段，错误处理.
        
    
    def get( self, addr, arg ):
        crc_l = 82 + addr
        crc_h = arg 
        h_addr = addr + 128 
        bys = struct.pack( '<BBBBBBBB', h_addr, h_addr, 82, arg, 0, 0, crc_l, crc_h )
        #print( 'Ttest!!', bys )
        self.write( bys )
        ##发送完成立即接受，这里也可以根据不同协议设定空闲
        print( 'Ttest!!' )
        rev = self.receive( addr )
        print( 'Ttest!!' )
        if isinstance( rev, list ):
            rev.append(1)
            return rev
        ##下面代码用于返回不同读错误的标志数，用于日志或者分析错误原因
        elif rev == -1:         ##temp:临时段，错误处理.
            return  [ 0, time.time(), -1]
        ''' if isinstance( rev, int ):
                if rev ==**
                    pass
                elif rev ==**
            '''
        print( 'Ttest!!', bys )

    def post():
        pass
