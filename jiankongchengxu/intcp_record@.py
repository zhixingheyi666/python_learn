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
import pickle
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
            if tt0 > 0.03 and len( data ) >= 18:
                dataq.put( ( data, t1 ) )
                data = l
            else:
                data += l
            t0 = t1
def record( dataq, ctrlq, doc = 'Unset!!'):
    fname = 'intcp' + time.strftime('%H%M%S') + '.ire'
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
                print( pickle.load( f ) )
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
