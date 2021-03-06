# -- coding: utf-8 --

from tkinter import *
import random 
def callback():
        var.set( '数据采集中……\n有文波监控，无忧生产！' )
        var2.set( random.choice( MAC ) )
        print( v.get() )


def show():
    var.set( e1.get() )
    var2.set( e2.get() )


root = Tk( )

photof1 = PhotoImage( file = 'd:\\python_learn\\images\\frame1bg.gif' )
photof2 = PhotoImage( file = 'd:\\python_learn\\images\\frame2bg.gif' )
photog1 = PhotoImage( file = 'd:\\python_learn\\images\\groupbg.gif' )

frame1 = Frame( root )
frame2 = Frame( root )
frame3 = Frame( frame1  )

frame1.pack( padx = 10, ipadx = 100)
frame2.pack( anchor = W,side = BOTTOM, padx = 10 )
frame3.pack( side = RIGHT, anchor = SE )

group = LabelFrame( root, text = '设备列表：', font = ( '华文新魏', 8 ),
                    padx = 5, pady = 5,
                    ) 
group.pack( anchor = W, side = BOTTOM, padx = 10, pady = 10 )

v = IntVar()
var = StringVar()
var.set( '请务必认真阅:\n读操作规程!' )
MAC = ['1号温控曲线','2号温控曲线','3号温控曲线','4号温控曲线',]
var2 = StringVar()
var2.set( random.choice( MAC ) )
photo = PhotoImage( file = 'd:\\python_learn\\images\\wb01.gif' )
imageLabel = Label( frame1, image = photo )
imageLabel.pack( anchor = NE, side = RIGHT, padx = 30 )


argL = ['HIAL', 'LoAL', 'HdAL', 'LdAL', 'AHYS', 'AdIS', 'AOP', 'CtrL', 'Srun',
        'Act', 'At', 'P', 'I', 'd', 'CtI', 'CHYS', 'InP', 'dPt', 'SCL', 'SCH',
        'Scb', 'FILt', 'OPt', 'OPH', 'OEF', 'Addr', 'bAud', 'AF', 'SPL', 'SPH',
        'SPr', 'Pno', 'PonP', 'PAF', 'EP1', 'EP2', 'EP3', 'EP4', 'EP5', 'EP6',
        'EP7', 'EP8' ]

albSr = Scrollbar( group, elementborderwidth = 7 )
albSr.grid( row = 0, column = 5, ipady = 10)

arglb = Listbox( group, height = 4, yscrollcommand = albSr.set )
arglb.grid( row = 0, column = 4 )


for al in argL:
    arglb.insert( END, al )

albSr.config( command = arglb.yview )


textlabel2 = Label( frame1, textvariable = var2, justify = LEFT,\
                    padx = 20, pady = 10,
                    font = ( '华文新魏',25 ),
#                    image = photof1
                    )
textlabel2.pack( anchor = SW, side = LEFT )



textlabel = Label( frame1, textvariable = var, justify = LEFT,\
                    padx = 20, pady = 10,
                    font = ( '华文新魏',25 ),
#                    image = photof2
                    )
textlabel.pack( anchor = SW, side = LEFT )


mybutton = Button( frame2,
                    text = '开始监控',
                    bg = 'black',
                    fg = 'blue',
                    font = ( '华文行楷', 10 ),
                    command = callback
                    ).grid( row = 0, column = 3, padx =10, pady = 5 )
#mybutton.pack( )

vr = IntVar()
textlist = [ ( 'One', 0 ), ( 'Two', 1 ), ( 'Three', 2 ) ]

for tx, num in textlist:
#   Radiobutton( frame2, text = myxt, variable = vr, value = 2 )
    Radiobutton( frame2, text = tx, variable = vr, 
                    value = num 
                )\
        .grid( row = 0, column = num , sticky = W, padx = 10, pady = 10 )


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
    c = Checkbutton( group,
                        text = mac,
                        variable = macvar[ -1 ] 
                        )\
        .grid( row = 0, column = count, sticky = W, padx =10, pady = 6 )
    count += 1
    macstr.set( macface( macvar[ -1 ], count ) )
    l = Label( frame3, textvariable = macstr  )
    l.pack( side =BOTTOM , anchor = W )


b1 = Label( group, text = '管理账户：', justify = RIGHT ).grid( row = 1, column = 0, padx =5, pady = 5 )
b2 = Label( group, text = '密码：', justify = RIGHT ).grid( row = 2, column = 0, padx =5, pady = 5 )

acount = StringVar()
passwd = StringVar()

e1 = Entry( group, textvariable = acount )
e1.grid( row = 1, column = 1, sticky = W, padx =10, pady = 6 )
#e1.pack( anchor = E, side = RIGHT, padx = 10, pady = 10 )
e1.delete = ( 0, END )
#e1.insert( 12, '请设置报警上限' )

e2 = Entry( group, textvariable = passwd, show = '@' )
e2.grid( row = 2, column = 1, sticky = W, padx =10, pady = 6 )

bton1 = Button( group, text = '获取信息', command = show ).grid( row = 3, column = 0, sticky = W )
bton2 = Button( group, text = '退出', command = root.quit ).grid( row = 3, column = 0, sticky = E )

mainloop()

