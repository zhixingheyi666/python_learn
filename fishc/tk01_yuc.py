# -- coding: utf-8 --

from tkinter import *
import random 
def callback():
        var.set( '数据采集中……\n有文波监控，无忧生产！' )
        var2.set( random.choice( MAC ) )
        print( v.get() )

root = Tk()


frame1 = Frame( root )
frame2 = Frame( root )

v = IntVar()

var = StringVar()
var.set( '请务必认真阅:\n读操作规程!' )

MAC = ['1号温控曲线','2号温控曲线','3号温控曲线','4号温控曲线',]

var2 = StringVar()
var2.set( random.choice( MAC ) )

textlabel2 = Label( frame1, textvariable = var2, justify = LEFT,\
                    padx = 20, pady = 10,
                    font = ( '华文新魏',25 ))
textlabel2.pack( side = BOTTOM )



textlabel = Label( frame1, textvariable = var, justify = LEFT,\
                    padx = 20, pady = 10,
                    font = ( '华文新魏',25 ))
textlabel.pack( side = LEFT )

photo = PhotoImage( file = 'd:\\python_learn\\images\\wb01.gif' )
imageLabel = Label( frame1, image = photo )
imageLabel.pack( side = RIGHT, padx = 30 )

mybutton = Button( frame2,
                    text = '开始监控',
                    bg = 'black',
                    fg = 'blue',
                    font = ( '华文行楷', 10 ),
                    command = callback
                    )
mybutton.pack( )

vr = IntVar()
textlist = [ 'One', 'Two', 'Three' ]

for myxt in textlist:
#   Radiobutton( frame2, text = myxt, variable = vr, value = 2 )
    Radiobutton( frame2, text = myxt, variable = vr, 
                    value = textlist.index( myxt )
                ).pack( anchor = SE )


macvar = []


def macface( i, count ):
    if i == 1:
        return '{0}号温控仪：2{1}.{2} ℃'.format( count, count ** 2, count + 3 )
    else:
        return '{0}号温控仪：CLOSE'.format( count )
count = 0

macstr = StringVar()
macstr.set('')

for mac in MAC:
    macvar.append( IntVar() )
    c = Checkbutton( frame2,
                        text = mac,
                        variable = macvar[ -1 ] 
                        )
    c.pack( anchor = NW )
    count += 1
    macstr.set( macface( macvar[ -1 ], count ) )
    l = Label( frame1, textvariable = macstr  )
    l.pack( side = 'top' )

frame1.pack( padx = 10 )
frame2.pack( side = RIGHT, padx = 10 )
mainloop()

