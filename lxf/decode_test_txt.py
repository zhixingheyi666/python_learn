# -- coding: utf-8 --
import queue, threading
import os, struct
import pickle
import time

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
    if os.path.isfile( srcf ):
        f = open( srcf, 'rb' )
        cmt = pickle.load( f )
    dfname = 'D:\\python_learn\\jiankongchengxu\\intcp000457.txt'
    while( sflg() ):
        flg = sflg()
        if isinstance( srcq, queue.Queue ) :
            if flg:
                while(  not srcq.empty() ):
                    d = srcq.get( block = 0 )
                    s_que.put( d )
            else:
                i = 0
                while( i < 4 ):
                    try:
                        d = srcq.get( block = 0 )
                        s_que.put( d )
                        i += 1
                    except queue.Empty:
                        if flg:
                            break
                        time.sleep( 1 )
        elif os.path.isfile( srcf ):
            try:
                for i in range( 6 ):
                    lst = pickle.load( f ) 
                    llen = len( lst[0] )
                    sstr = 'B' * llen
                    rev = struct.unpack( sstr, lst[0] )
                    rev_str = list( map( lambda x: '{0:0>2x}'.format( x ), rev) ) 
                    rstr = '\t'  
                    for i in rev_str:
                        rstr = rstr + ' ' + i  
                    print( rstr,'----', lst[1] ) 
                    df = open( dfname, 'a' )
                    df.write( rstr + '\n' )
                    df.close()
                    #print( l, '+++', type( l ) )
                    #print( l[0] )
                    #s_que.put( l )
                    #time.sleep( 0.3 )
            except EOFError:
                print( '已经解析到文件末尾！' )
                break
#if __name__ == '__main__':
ctrlq = queue.Queue()
i_dcd( ctrlq,srcf='d:\\python_learn\\jiankongchengxu\\intcp231840.ire' )
fname = 'D:\\python_learn\\jiankongchengxu\\intcp000457.ire'
input( 'Press to End!' )






