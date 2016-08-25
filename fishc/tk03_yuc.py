# -- coding: utf-8 --

from tkinter import *
import random
root = Tk()
maclist = ['1号温控曲线', '2号温控曲线', '3号温控曲线', '4号温控曲线',]
print( maclist )

macvar = StringVar()

print( macvar.get()  )
print( dir( macvar )  )

v = IntVar()

c = Checkbutton( root,
                    text = '一号温控曲线',
                    variable = v
                    )
c.pack()

l = Label( root, textvariable = macvar, font = ( '华文新魏', 12 ) )
l.pack()

mainloop()
