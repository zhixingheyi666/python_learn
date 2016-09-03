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
def skhead( s_byte ):
    for n in range( 29 ):
        if s_byte[n] in range( 128, 257 ):
            if s_byte[n] == s_byte[ n + 1 ]
                return ( 1, n )
            elif s_byte[n] == zkaddr and s_byte[ n + 1 ] == 3:
                return ( 2, n )
            if n > len( s_byte ) -18 - 1:
                return ( 0, n )

def dcd516( s_byte, dbfq ):
    pass


def zk( s_byte, dbfq ):
    pass




def i_dcd( ctrlq, srcq = 0, srcf = 0 ):
    #s_que = queue.Queue()
    #s_byte，待解析字节码
    s_byte= b''
    #sflg，终止线程标志函数
    sflg = ctrlq.empty
    #zkaddr，真空计地址
    zkaddr = 20
    #dbfq，解析结果暂存队列
    dbfq = queue.Queue()
    if os.path.isfile( srcf ):
        f = open( srcf, 'rb' )
        cmt = pickle.load( f )
    #dfname = 'D:\\python_learn\\jiankongchengxu\\intcp000457.txt'
    while( sflg() ): ## or s_byte ! = b''
        flg = sflg()
        if isinstance( srcq, queue.Queue ) :
            if flg:
                while(  not srcq.empty() ):
                    d = srcq.get( block = 0 )
                    #s_que.put( d )
                    s_byte += d[0]
            else:
                i = 0
                while( i < 4 ):
                    try:
                        d = srcq.get( block = 0 )
                        s_byte += d[0]
                        #s_que.put( d )
                        i += 1
                    except queue.Empty:
                        if sflg():
                            break
                        time.sleep( 1 )
        elif os.path.isfile( srcf ):
            try:
                for i in range( 6 ):
                    lst = pickle.load( f ) 
                    s_byte += lst[0]
                    #llen = len( lst[0] )
                    #sstr = 'B' * llen
                    #rev = struct.unpack( sstr, lst[0] )
                    #rev_str = list( map( lambda x: '{0:0>2x}'.format( x ), rev) ) 
                    #rstr = '\t'  
                    #for j in rev_str:
                    #    rstr = rstr + ' ' + j  
                    #print( rstr,'----', lst[1] ) 
                    #df = open( dfname, 'a' )
                    #df.write( rstr + '\n' )
                    #df.close()
                    #time.sleep( 0.3 )
            except EOFError:
                print( '已经解析到文件末尾！' )
                break
    head = skhead( s_byte ) 
    ##有一种情况，本来有一组消息被解析校验正确，可是在这个消息中间又
    ##找到新的消息头（比如516p的两个重复的地址），这种情况概率很小，可以不考虑
    while( True ):
        if head[1] != 0:
            dbfq.put( s_byte[ :head[1] ] )
            if head[0] == 0:
                s_byte = s_byte[ head[1]: ]
                break
            s_byte = s_byte[ head[1]: ]
        #516解析成功，砍掉解析成功部分，继续查找后面
        #解析失败，砍掉这个head，继续查找后面
        if head[0] == 1:
            ddflag = dcd516( s_byte, dbfq )
            if ddflag[0]:
                s_byte = s_byte[ ddflag[1]: ]
            else:
                dbfq.put( s_byte[0] ] )
                s_byte = s_byte[ 1: ]
        #真空计解析成功，砍掉解析成功部分，继续查找后面
        #解析失败，砍掉这个head，继续查找后面
        elif head[0] == 2: 
            dzflag = zk( s_byte, dbfq )
            if dzflag[0]:
                s_byte = s_byte[ dzflag[1]: ]
            else:
                dbfq.put( s_byte[0] ] )
                s_byte = s_byte[ 1: ]




#if __name__ == '__main__':
#ctrlq = queue.Queue()
#i_dcd( ctrlq,srcf='d:\\python_learn\\jiankongchengxu\\intcp231840.ire' )
#fname = 'D:\\python_learn\\jiankongchengxu\\intcp000457.ire'
#input( 'Press to End!' )






