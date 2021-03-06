# -- coding: utf-8 --

import serial, time, queue
import pickle, struct 
import threading
import decode_tt as dcd
#import decode as dcd
import intcp_record_dcd1_tt as intcpt 
import display as dsP
from tkinter import *


fps = 0.05
#fps，GUI界面刷新周期，这里暂定0.05，也就是说频率为每秒20次
cnt = 50
#界面缓存
def refresh( event ):
    global cnt
    while( True ):
        if cnt:
            cnt -= 1
        try:
            if not cnt:
                #print( 'MMMMMMMMMMMMMM' )
                dcdout.delete( 1.0, 2.0 )
            dcdout.insert( "insert", doutq.get( block = 0 ) )
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
'''
def mkevn():
    while( True ):
        if input( 'd' ) == 'd':
            root.event_generate( "<<Refr>>" )
        time.sleep(1)
'''

def mk_evn():
    i = 0
    while( ctrlq.empty() and 0 < 300 ):
        if not doutq.empty():
            root.event_generate( "<<Refr>>" )
        time.sleep( fps )
        i += 1


dataq = queue.Queue()
ctrlq = queue.Queue()
srcq = queue.Queue()
doutq = queue.Queue()
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
root.bind( "<<Refr>>", refresh )
#dsp = threading.Thread( target = dsptask.root.mainloop() )
#dsp = threading.Thread( target = dsP.dsp, args = ( doutq,)  )
def main_tt():
    isOpen.clear()
    mke = threading.Thread( target = mk_evn, )
    istop = threading.Thread( target = intcpt.stop, args = ( ctrlq, )  )
    fname = 'D:\\python_learn\\data\\intcp_im011515.ire'
    dfname = 'd:\\python_learn\\data\\dcd_intcp' + time.strftime( '%H%M%S' ) + '.txt'
    idecode = threading.Thread( target = dcd.i_dcd,
                                args = ( dfname,
                                            ctrlq,
                                            0,
                                            fname,
                                            doutq,
                                            14,
                                            0.6,
                                            )
                                )
    idecode.start()
    mke.start()
    istop.start()
    root.mainloop()
    idecode.join()
    mke.join()
    istop.join()

if __name__ == '__main__':
    main_tt()

