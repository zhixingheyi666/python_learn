# -- coding: utf-8 --
'''
这是一个侦听宇电516P,温控仪与触摸屏通信的程序。
    程序构架：
        端口监听线程:
            不间断监听COM口，记录任何线上数据
        原始数据记录线程：
            将监听来的数据附加必要信息，然后记录到文件
        数据分析线程：
            记录到文件的数据进行解析，输出分析结果到指定文件
        GUI线程：
            提供界面，方便小白操作
'''
import serial, time, queue

##监听端口的函数
dataq = queue.Queue()

def intercept( , iport = 'COM3', timeout = 0 ):
    com = serial.Serial( port = iport )
    while( True ):
        date = iport.readall()
        if data != b'':
            len(data) ? 8,10
            squeue.put( data )

        pass

