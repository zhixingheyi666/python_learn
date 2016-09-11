# -- coding: utf-8 --
from tkinter import *

'''
def dsp( doutq ):
    dsptask = disPlay( doutq )
    mainloop()
'''   


class disPlay():
    def __init__( self, doutq ):
        self.doutq = doutq
        self.root = Tk()
        self.root.title( '通信数据破解程序——王文波' )
        self.root.bind( "refr", self.refresh )
        self.dcdout = Text( self.root,
                            bg = 'black',
                            fg = 'green',
                            width = 115,
                            height = 40,
                            border = 5,
                            )
        self.dcdout.grid( row = 0,
                            column = 0,
                            #padx = 20,
                            #pady = 20,
                            )
        self.dataout = Text( self.root,
                            bg = 'black',
                            fg = 'green',
                            width = 70,
                            height = 40,
                            border = 5,
                            )
        self.dataout.grid( row = 0,
                            column = 1,
                            #padx = 20,
                            #pady = 20,
                            )
    def refresh( self ):
        while( True ):
            try:
                self.dcdout.insert( "insert", self.doutq.get() )
                self.root.update()
            except Exception:
                return



if __name__ == '__main__':
    selftest = disPlay( doutq )
    mainloop()

