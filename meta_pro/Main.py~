# -- coding: utf-8 --

import serial, time, queue
import pickle, struct 
import threading
import decode_tt as dcd
#import decode as dcd
import intcp_record_dcd1_tt as intcpt 
from tkinter import *


fps = 0.05
#fps，GUI界面刷新周期，这里暂定0.05，也就是说频率为每秒20次
cnto = 50
cnta = 50
#界面缓存
def refresho( event ):
    global cnto
    while( True ):
        if cnto:
            cnto -= 1
        try:
            if not cnto:
                #print( 'MMMMMMMMMMMMMM' )
                dcdout.delete( 1.0, 2.0 )
            dcdout.insert( "insert", o_doutq.get( block = 0 ) )
            root.update()
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
            if not cnta:
                #print( 'MMMMMMMMMMMMMM' )
                dataout.delete( 1.0, 2.0 )
            dataout.insert( "insert", a_doutq.get( block = 0 ) )
            root.update()
        except Exception:
            #print( 'SSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSSss' )
            return

def mk_evn():
    while( ctrlq.empty() ):
        #print( 'MMMMMMMMMMMMMM' )
        #print( o_doutq.empty() ) 
        if not o_doutq.empty():
            root.event_generate( "<<Refro>>" )
        if not dataq.empty():
            root.event_generate( "<<Refra>>" )
        time.sleep( fps )

a_doutq = queue.Queue()
o_doutq = queue.Queue()
#a_doutq,o_doutq用来存储向两个Text Widget输出的文本信息
dataq = queue.Queue()
ctrlq = queue.Queue()
srcq = queue.Queue()
isOpen = threading.Event()
root = Tk()
root.title( '通信数据破解程序——王文波' )
#self.root.bind( "refr", self.refresh )
dcdout = Text( root,
                    #bg = 'black',
                    bg = 'white',
                    fg = 'green',
                    width = 115,
                    height = 40,
                    border = 5,
                    )
dcdout.grid( row = 0,
                    column = 0,
                    #padx = 20,
                    #pady = 20,
                    )
dataout = Text( root,
                    bg = 'black',
                    fg = 'green',
                    width = 70,
                    height = 40,
                    border = 5,
                    )
dataout.grid( row = 0,
                    column = 1,
                    #padx = 20,
                    #pady = 20,
                    )
root.bind( "<<Refro>>", refresho )
root.bind( "<<Refra>>", refresha )

def main():
    isOpen.clear()
    mke = threading.Thread( target = mk_evn, )
    #前面是图形界面的事件生成函数，后面是后台串口监听和数据解析函数
    #interp = threading.Thread( target = intcpt.intercept, args = ( dataq, ctrlq )  )
    #rcd = threading.Thread( target = intcpt.record, args = ( dataq, srcq, ctrlq, '序列化测试！' )  )
    istop = threading.Thread( target = intcpt.stop, args = ( ctrlq, )  )
    fname = 'D:\\python_learn\\data\\intcp_im011515.ire'
    dfname = 'd:\\python_learn\\data\\dcd_intcp' + time.strftime( '%H%M%S' ) + '.txt'
    idecode = threading.Thread( target = dcd.i_dcd,
                                args = ( dfname,
                                            ctrlq,
                                            0,
                                            fname,
                                            o_doutq,
                                            14,
                                            0.6,
                                            )
                                )
    idecode.start()
    mke.start()
    #rcd.start()
    #interp.start()
    istop.start()
    root.mainloop()
    #interp.join()
    #rcd.join()
    idecode.join()
    mke.join()
    istop.join()
    print( 'Success!' )


if __name__ == '__main__':
    main()

