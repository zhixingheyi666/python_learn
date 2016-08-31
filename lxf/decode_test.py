# -- coding: utf-8 --
import queue, threading

'''
本函数可以接受srcq（Queue类型），或者srcf（文件绝对路径）两种参数
    前者    方便对监听的实时数据进行解码，
    后者    是对已经存在的数据文件进行解码
    解码说明：
        本程序仅适用宇电516P
        解码后将包含：
            距离开始监控的时间
                也即设备开机时间,实际上是监控程序启动的时间
                所以要求启动监控之后，立即启动设备
            地址 
            参数编号（和对应的英文缩写）
            读/写
            读/写 的参数值
            测量值
            给定值
            输出值
            报警状态
            
    解码后的信息：
        1.生成解码文件，初定为字符串按行文本文件，作为一种数据备份
        2.生成解码队列，供数据统计展示模块调用
'''
def i_dcd( ctrlq, srcq = 0, srcf = 0 ):
    s_que = queue.Queue()
    sflg = ctrlq.empty
    while( sflg() ):
        flg = sflg()
        if isinstance( srcq, queue.Queue ) :
            if flg:
                while(  not srcq.empty() ):
                    d = srcq.get( block = 0 )
                    s_que.put( d )






