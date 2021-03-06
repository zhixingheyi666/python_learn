# -- coding: utf-8 --

import serial, time, queue
import pickle, struct 
import threading
from tkinter import *

def refresh( root, dcdout):
        dcdout.insert( "insert",
                            'dddddddddddddddddddddddddddddddddddddd'
                            )
        root.update()
def ref( event ):
    dcdout.insert( "insert",
                            'dddddddddddddddddddddddddddddddddddddd'
                            )
    root.update()
    print( 'MMMMMMMMMMMMMMMM' )

def make_event():
    while( True ):
        if input( 'Please input \'d\'' ) == 'd':
            root.event_generate( "<<Refr>>" ) 
print( 'This is mainloop!!' )
doutq = queue.Queue()
isOpen = threading.Event()
root = Tk()
root.title( '通信数据破解程序——王文波' )
#self.root.bind( "refr", self.refresh )
dcdout = Text( root,
                    bg = 'black',
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
'''
root.bind( "<<Refr>>",
            lambda e: dcdout.insert( "insert",
                        'dddddddddddddddddddddddddddddddddddddd'
                            ) )
'''
root.bind( "<<Refr>>", ref )

def main():
    isOpen.clear()
    mkevnt = threading.Thread( target = make_event )
    mkevnt.start()
    root.mainloop()
    mkevnt.join()
if __name__ == '__main__':
    main()
