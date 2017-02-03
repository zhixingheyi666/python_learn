# -- coding: utf-8 --

import serial, time, queue
import pickle, struct 
import threading
import decode as dcd
#import decode as dcd
import intcp_record as intcpt 
from tkinter import *
import random


fps = 0.001
#fps，GUI界面刷新周期，这里暂定0.05，也就是说频率为每秒20次
cnto = 50
cnta = 60
cntfc = 60
#界面缓存
def refresho( event ):
    global cnto
    while( True ):
        if cnto:
            cnto -= 1
        try:
            dcdout.insert( "insert", o_doutq.get( block = 0 ) )
            if not cnto:
                #print( 'MMMMMMMMMMMMMM' )
                dcdout.delete( 1.0, 2.0 )
            dcdout.update()
            '''
            s = txt1.get('1.0','end')
            s = ''.join('%02X' %i for i in [ord(c) for c in s])
            txt1.delete('1.0','end')
            txt1.insert("insert",s)
            '''       
        except Exception:
            #print( 'SSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSss' )
            return

def refresha( event ):
    global cnta
    while( True ):
        if cnta:
            cnta -= 1
        try:
            dataout.insert( "insert", a_doutq.get( block = 0 ) )
            time.sleep( 0.007 )
            #上面是屏幕输出延时，使得输出看起来连贯
            if not cnta:
                #print( 'MMMMMMMMMMMMMM' )
                dataout.delete( 1.0, 2.0 )
            root.update()
        except Exception:
            #print( 'SSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSss' )
            return

def mk_evn():
    c_fps = 0
    #c_fps，通过计数来控制不同频率
    while( ctrlq.empty() ):
        if  c_fps > 20:
            #if ( not o_doutq.empty() ) and c_fps > 20:
                #root.event_generate( "<<Refro>>" )
            c_fps = 0
        if  not o_doutq.empty(): 
            dcdout.event_generate( "<<Refro>>" )
        if not dataq.empty():
            root.event_generate( "<<Refra>>" )
        c_fps += 1
        print( c_fps ) 
        fancy.event_generate( "<<Fcy>>" )
        time.sleep( fps )

def fcy( event ):
    global cntfc
    if cntfc:
        cntfc -= 1
    if not cntfc:
        fancy.delete( 1.0, 2.0 )
    fancy.insert( "insert", str( random.randint( 0, 20 ) ) + '\n' )


a_doutq = queue.Queue()
o_doutq = queue.Queue()
#a_doutq,o_doutq用来存储向两个Text Widget输出的文本信息
dataq = queue.Queue()
ctrlq = queue.Queue()
srcq = queue.Queue()
isOpen = threading.Event()
root = Tk()
root.title( '王文波--通信数据破解程序--王文波--王文波--王文波' )
#self.root.bind( "refr", self.refresh )
frame = Frame( root )
frame.grid( row = 0,
                    column = 1,
                    sticky = N + E + S + W
                    #padx = 20,
                    #pady = 20,
                    )
dcdout = Text( root,
                    font = ( '仿宋', 16 ),
                    bg = 'black',
                    #bg = 'white',
                    fg = 'green',
                    width = 75,
                    height = 25,
                    border = 5,
                    )
dcdout.grid( row = 0,
                    column = 0,
                    #padx = 20,
                    #pady = 20,
                    sticky = N + E + S + W
                    )
dataout = Text( root,
                    font = ( '宋体', 14 ),
                    bg = 'black',
                    fg = 'green',
                    width = 41,
                    height = 30,
                    border = 5,
                    )
dataout.grid( row = 0,
                    column = 2,
                    #padx = 20,
                    #pady = 20,
                    sticky = N + E + S + W
                    )
wenbo = PhotoImage( file = 'd:\\python_learn\\meta_pro1.6\\wb31.gif' )
#wenbo = PhotoImage( file = 'd:\\python_learn\\images\\wb01.gif' )
imagelabel = Label( frame, image = wenbo )
imagelabel.grid( row = 0,
                    column = 0,
                    sticky = N + E + S + W
                    #padx = 20,
                    #pady = 20,
                    )
fancy = Text( frame,
                    font = ( '宋体', 12 ),
                    bg = 'black',
                    fg = 'white',
                    width = 7,
                    height = 30,
                    border = 5,
                    )
fancy.grid( row = 1,
                    column = 0,
                    sticky = N + E + S + W
                    #padx = 20,
                    #pady = 20,
                    )
dcdout.bind( "<<Refro>>", refresho )
root.bind( "<<Refra>>", refresha )
fancy.bind( "<<Fcy>>", fcy )
dcdout.insert( "insert", '测试文字，81 81 52 01 x0b xcd xff\n' ) 
dataout.insert( "insert", '测试文字，81 81 52 01 x0b xcd xff\n' ) 

def main():
    isOpen.clear()
    mke = threading.Thread( target = mk_evn, )
    #前面是图形界面的事件生成函数，后面是后台串口监听和数据解析函数
    interp = threading.Thread( target = intcpt.intercept, args = ( dataq, ctrlq )  )
    rcd = threading.Thread( target = intcpt.record,
                            args = ( dataq,
                                        srcq,
                                        ctrlq,
                                        a_doutq,
                                        '序列化测试！'
                                    )  
                            )
    istop = threading.Thread( target = intcpt.stop, args = ( ctrlq, )  )
    fname = 'D:\\python_learn\\data\\intcp_im011515.ire'
    dfname = 'd:\\python_learn\\data\\dcd_intcp' + time.strftime( '%H%M%S' ) + '.txt'
    idecode = threading.Thread( target = dcd.i_dcd,
                                args = ( dfname,
                                            ctrlq,
                                            srcq,#0,
                                            0,#fname,
                                            o_doutq,
                                            14,
                                            0.6,
                                            )
                                )
    idecode.start()
    mke.start()
    rcd.start()
    interp.start()
    istop.start()
    root.mainloop()
    interp.join()
    rcd.join()
    idecode.join()
    mke.join()
    istop.join()
    print( 'Success!' )


if __name__ == '__main__':
    main()

