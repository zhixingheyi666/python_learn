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
import pickle, struct 
import threading

##监听端口的函数
def intercept( dataq, ctrlq, iport = 'COM3', timeout = 0 ):
    com = serial.Serial( port = iport, timeout = 0 )
    data = b''
    t0 = time.clock()
    print( ctrlq.empty(),'  intercept' )
    while( ctrlq.empty() ):
#        print( ctrlq.empty(),'  intercept' )
        l = com.read( 1000 )
        t1 = time.clock()
        if l !=  b'':
            tt0 = t1 - t0 
            '''
                moudbus协议RTU要求帧之间最少有大于3.5个字符传输时间的空闲。
                    如果我把tt0设置为大于传输4个字节的时间，那么不同的请求帧（因为是USB模拟串口的限制，
                    有时监听设备会把请求和响应这一组帧当做一个消息帧读入）确定不会被拼接。
                    但是一则长消息如果被拆分（也是USB模拟的问题）接收，且有些部分大于
                    4个字节，本程序将不会将这些拆分的段组合起来。一帧消息被分段了。
                    我们的目的就是希望一帧消息尽可能不被分段，按照原样接收。如果增大tt0
                    可以靠近这个目的，但是也增大了末尾的小拆分被误拼接到下一消息的概率。
                    怎样平衡呢？测试才知道。末尾出现小拆分的概率应该相对较小吧？
                    先把tt0设置成大于6或者8个字节的传输时间试试？这样6或者8个字节的消息
                    确定不会被拆分。对应的2或者4个字节的末尾小拆分将被合并到下一消息。
                    根据上面分析tt0是根据设备通信间隔（例如，3.5字符空闲）设定的。如果
                    实际设备的要求的通信间隔时间更长，如宇电516P的150毫秒，tt0也可以相应变大。
                    6(字节) * ( 1 + 8 + 1 ) / 9600 * = 0.0063 秒
            '''
            if tt0 > 0.0063:## or len( data ) >= 10:
                dataq.put( ( data, t1 ) )
                data = l
            else:
                data += l
            t0 = t1
def record( dataq, ctrlq, doc = 'Unset!!'):
    fname = 'intcp_im' + time.strftime('%H%M%S') + '.ire'
    f = open( fname, 'wb' )
    pickle.dump( doc.encode( 'utf-8' ), f )
    f.close()
    ##写入文件头
    '''
    if doc != '':
        f = open( fname, 'wb' )
        f.write( doc.encode( 'utf-8' ) )    
        f.close()
    '''
    f =  open( fname, 'ab' )
    i = 0
    ftell = 0
    print( ctrlq.empty(),'  record' )
    while( ctrlq.empty() or not dataq.empty()  ):
#        print( ctrlq.empty(),'  record' )
        try:
            d = dataq.get( block = 0 )
        except Exception:
#            print( 'Empty!' )
            continue
        pickle.dump( d, f )
        i += 1
        if i % 10 == 0:
            f.close()
            #f =  open( fname, 'ab' )
        ##以下代码仅作为本次验证使用，实际操作的时候，可以直接在端口线程为分析
        ##进程再单独建立一个队列。本进程仅作为原始数据备份。
            f =  open( fname, 'rb' )
            f.seek( ftell )
            for x in range( 10 ):
                print( x )
                lst = pickle.load( f ) 
                try:
                    llen = len( lst[0] )
                except TypeError:
                    print( '\tTypeError' )
                    print( '\tlst:\t',lst)
                    print( '\tlst[0]:\t',lst[0])
                    continue
                sstr = 'B' * llen
                rev = struct.unpack( sstr, lst[0] )
                rev_str = list( map( lambda x: '{0:0>2x}'.format( x ), rev) ) 
                rstr = '\t'  
                for j in rev_str:
                    rstr = rstr + ' ' + j  
                print( rstr,'----', lst[1] ) 
                #print( rev,'----', lst[1] )
                #print( len( tt[0] ) )
                #print( pickle.load( f ) )
            ftell = f.tell()
            f.close()
            f =  open( fname, 'ab' )
    f.close()

def stop( ctrlq ):
    while( ctrlq.empty() ):
        s = input( 'Press \'s\' to stop this programme:' )
        print( ctrlq.empty() )
        print( 'RUN' )
        print( s )
        if s == 's':
            print( 'To stop' )
            ctrlq.put( 1 )
            print( ctrlq.empty() )
        else:
            time.sleep( 5 )



def main():
    dataq = queue.Queue()
    ctrlq = queue.Queue()
    interp = threading.Thread( target = intercept, args = ( dataq, ctrlq )  )
    rcd = threading.Thread( target = record, args = ( dataq, ctrlq, '序列化测试！' )  )
    istop = threading.Thread( target = stop, args = ( ctrlq, )  )
    interp.start()
    rcd.start()
    istop.start()
    interp.join()
    rcd.join()
    istop.join()
    print( 'Success!' )

if __name__ == '__main__':
    main()
