# -- coding: utf-8 --

import tkinter as tk

class APP:
    def __init__( self, master ):
        frame = tk.Frame( master )
        frame.pack( side = tk.LEFT, padx = 10, pady = 10 )
        
        self.hi_there = tk.Button( frame, text='选项', fg = 'green', \
                bg = 'black', command = self.bua_show )
        self.hi_there.pack()

    def bua_show( self ):
        print( '当前端口波特率：9600' )



       
root = tk.Tk()
app = APP( root )

root.mainloop()
