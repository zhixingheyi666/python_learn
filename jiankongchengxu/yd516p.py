# -- coding: utf-8 --
                                ##class 宇电516p仪：每一块仪表就是他的一个实例。
'''
                                        父类，或更高层次的抽象：
                                             class 仪表---->串口通信仪表---->温控仪
                                        子类
                                             class monitor：数据流的监控方法，实例
                                        read():
                                             读取仪表参数的方法
                                                然后把参数存储到实例的对应属性中
                                             与monitor的区别，monitor将调用本方法获取数据
                                                并建立队列或者文件，记录存储大量
                                                或者长时间的数据，同时monitor应当
                                                具有根据设定的条件或者计算函数
                                                分析异常并报警的功能
                                        args_set():
                                            设定参数方法
                                        write():
                                             写入仪表参数的方法
                                        write():
                                            监控:定期发送数据请求，处理返回数据
                                        属性：
                                                短名称或者编号
                                            地址
                                            参数及参数值
                                                AI协议每次都返回参数值，不写在Args字典中，独立出来
                                                    PV
                                                    SV
                                                    MV
                                                    Statu_A
                                                参数值设定更新方法，
                                                    可以设定多长时间更新一回
                                                数据结构：{ 参数名:( 参数代号, { 参数当前值:value, 参数设定值:value, 其他备用选项.... }  ) }

                                        资料：
                                            采样周期：每秒8次
                                            16位补码表示数值范围：-32766~~~32767
                                            STEP的SV范围：-122.0~~3200 或者 -1220~~32000
                                            数字范围：-9990~~32000
                                            宇电516P的SV（给定值），

                                    '''

from enum import Enum, unique
import Aibus
@unique
class Dfn( Enum ):
    Unknow = 32767

class Yd516p( Aibus.Aibus ):
    def __init__( self, addr, port, name = 'UNSET', baud = 9600  ):
        self.addr = addr
        #print( 'Ttest!1' , type( port ) , port)
        self.name = name
        self.baudrate = baud
        self.rtimeout = 0.150           ##根据仪表协议要求的最大等待时间
        super( Yd516p, self ).__init__( port, baud, self.rtimeout )
        self.init = 0
        self.tmprt = Dfn.Unknow.value
        self.__PV = Dfn.Unknow.value
        self.__SV = Dfn.Unknow.value
        self.__MV = Dfn.Unknow.value
        self.__Statu_A = Dfn.Unknow.value
        self.__Rftime = Dfn.Unknow.value
        self.Args = {
                    'iSV': (  0, {  'cvalue': Dfn.Unknow.value,
                                    'svalue': Dfn.Unknow.value,
                                    'vtime' : Dfn.Unknow.value,
                                    'bak0'  : Dfn.Unknow.value,
                                    'bak1'  : Dfn.Unknow.value,
                                    'bak3'  : Dfn.Unknow.value } ),
                    'dPt': (  12, { 'cvalue': Dfn.Unknow.value,
                                    'svalue': Dfn.Unknow.value,
                                    'vtime' : Dfn.Unknow.value,
                                    'bak0'  : Dfn.Unknow.value,
                                    'bak1'  : Dfn.Unknow.value,
                                    'bak3'  : Dfn.Unknow.value } ),
                    }

    def a_init( self ):
        if self.init == 0:
            #先generator一个“正在初始化某某仪表”的事件，给GUI
            for arg in self.Args:
                #print( 'Ttest!!', arg, ' ', self.Args[arg] )
                mk = self.read( self.Args[arg] )
                #if mk = **错误：
                #generator一个“**仪表初始化错误”的事件，给GUI
                #break
            self.init = 1
            
    def read( self, argt ):
        print( 'Ttest!1' )
        vlist = self.get( self.addr, argt[0] )
        print( 'Ttest!1' )
        if vlist[-1] == 1:
            argt[1]['cvalue'] = vlist[0]
            argt[1]['vtime'] = vlist[1]
            self.__Rftime = vlist[1]
            self.__PV = vlist[2]
            self.__SV = vlist[3]
            self.__MV = vlist[4]
            self.__Statu_A = vlist[5]
            return [ vlist[0], vlist[1] ] 
        #elif vlist[-1] == **:
        #    return 错误**
        elif vlist[-1] == -1:               ##temp:临时段，错误处理
            print( 'Time:', vlist[1], '  Read  ',argt[0],' failure!!' )
    def __getattr__( self, arg ):
                                ##
        '''                         每个实例应当有个仪表初始化标志变量，在未初始化之前，
                                    首次调用__getattr__将触发仪表初始化方法
                                    在GUI界面，启动设定的监控项目前，应提示操作员
                                    先进行初始化操作，如果失败，对应的监控项目将
                                    不会被启动
                                        '''
        if self.init == 0:
            self.a_init()
        if arg == 'PV':
            return self.getPV()
        elif arg == 'SV':
            return self.getSV()
        elif arg == 'MV':
            return self.getMV()
        elif arg == 'Statu_A':
            return self.getStatu_A()
        elif arg == 'Rftime':
            return self.getRftime()
        elif arg in self.Args:
            return   [ self.Args[arg][1]['cvalue'], self.Args[arg][1]['vtime'] ]
        else:
            pass


    def getPV( self, now = 0 ):
        if now == 1:
            self.read( self.Args['iSV'] )
        dpt = self.Args['dPt'][1]['cvalue']  
        if dpt in range( 4 ):
            return [ self.__PV * 10 ** -dpt , self.__Rftime ]  
        elif dpt in range( 128, 132 ):
            if self.__PV % 10 >= 5:                     ##四舍五入算法，参见sishewuru_test.py
                tt = 10
            else:
                tt = 0
            return [ ( self.__PV + tt ) // 10 * 10 ** -( dpt - 128 ), self.__Rftime ]  
        elif dpt == Dfn.Unknow.value:
             pass
        else:
            pass
        
    def getMV( self, now = 0 ):
        pass

    def getSV( self, now = 0 ):
        pass

    def getStatu_A( self, now = 0 ):
        pass

    def getRftime( self, now = 0 ):
        return self.__Rftime
