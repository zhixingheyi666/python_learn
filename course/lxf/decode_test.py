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
def skhead( s_byte, zkaddr ):
    for n in range( 29 ):
        #print( len( s_byte ) )
        if n > len( s_byte ) -18:
            return ( 0, n )
        if s_byte[n] in range( 128, 257 ):
            if s_byte[n] == s_byte[ n + 1 ]:
                return ( 1, n )
        elif s_byte[n] == zkaddr and s_byte[ n + 1 ] == 3:
            return ( 2, n )

def dcd516( s_byte, dbfq ):
    addr = s_byte[0] - 128
    ##默认一位小数
    dpt = 1

    if s_byte[2] == 82:
        ##按读指令解析
        arg = s_byte[3] 
        if s_byte[4] == 0 and s_byte[5] == 0:
            ##CRC校验
            if s_byte[6] == addr + 82 and s_byte[7] == arg:
                #设备识别码，指令识别码，所有解码的信息的前两个位置
                #设备识别：0，温控仪，1，真空计。
                #指令识别：00，读请求，01，读响应，10，写请求，11，写响应
                #设备地址，参数代号
                dcdr = [ 0, 0, addr, arg]
                #dcdr.append( '设备：<%02d号温控仪>' % addr)
                #dcdr.append( '<读> 请求::   ' )
                #dcdr.append( '目标地址：' )
                #dcdr.append( '目标参数：' )
                dbfq.put( dcdr )
                #s_byte = s_byte[ 8: ]
                ##继续解码后面设备响应的字节
                dcdrev = struct.unpack( 'BBBBbBBBBB', s_byte[ 8:18 ] ) 
                dcdtt = []
                dcdtt.append( dcdrev[6] + dcdrev[7] * 256 )
                dcdtt.append( dcdrev[0] + dcdrev[1] * 256 )
                dcdtt.append( dcdrev[2] + dcdrev[3] * 256 )
                crc = dcdrev[8] + dcdrev[9] *256
                rmk_crc = dcdtt[1] + dcdtt[2] + dcdrev[5] * 256 + dcdrev[4] + dcdtt[0] + addr
                if crc != rmk_crc % 65536:
                    return  ( 1, 8 ) 
                for dcdi in range( 3 ):
                    if dcdtt[ dcdi ] >= 32768:
                        dcdtt[ dcdi ] -= 65536
                    ##默认一位小数，dpt = 1
                    dcdtt[ dcdi ] = dcdtt[ dcdi ] * 10 ** -dpt
                dcdlst = [ 0, 1, addr ,arg ]
                #dcdlst.append( [ '设备 <%2d号温控仪> 响应::   ' % addr ] )
                #dcdlst.append( [ '参数 <%02XH> 返回值：' % arg ] )
                #dcdlst.append( time.time() )
                #dcdlst.append( [ '实时温度：' ] )
                #dcdlst.append( ['给定温度：'] )
                #dcdlst.append( ['输出值MV：'] )
                #dcdlst.append( ['仪表状态：'] )
                #参数返回值，实时温度，给定温度，输出值，仪表状态
                dcdArg = dcdtt[0]
                dcdlst.append( dcdArg )
                dcdPV = dcdtt[1]
                dcdlst.append( dcdPV )
                dcdSV = dcdtt[2]
                dcdlst.append( dcdSV )
                dcdMt = dcdrev[4]
                dcdlst.append( dcdMt )
                dcdAt = dcdrev[5]
                #print( dcdAt )
                dcdAtt = '{0:07b}'.format( dcdAt ) 
                dcdAlm = '' 
                for i in range( len( dcdAtt ) ):
                    if i % 2:
                        dcdAlm += dcdAtt[ i - 1: i + 1 ] + ' '
                dcdlst.append( dcdAlm )
                dbfq.put( dcdlst ) 
                #s_byte = s_byte[ 10: ]
                return ( 1, 18 )
        else:
            ##读解析错误
            return ( 0, 0 )
    elif s_byte[2] == 67:
        ##按写指令解析
        arg = s_byte[3] 
        argVt = s_byte[4] + s_byte[5] * 256
        w_crc = s_byte[6] + s_byte[7] * 256
        wmk_crc = arg * 256 + 67 + argVt + addr
        if w_crc != wmk_crc % 65536:
            #print( hex(wmk_crc) )
            #print( hex(w_crc) )
            return ( 0, 0 )
        dcdw = [ 0, 2, addr, arg ]
        #dcdw.append( '设备：<%02d号温控仪>' % addr)
        #dcdw.append( '<写> 指令::   ' )
        #dcdw.append( '目标地址：' )
        #dcdw.append( '目标参数：' )
        #dcdw.append( '写入值：' )
        #dcdw.append( addr )
        #dcdw.append( arg )
        if argVt >= 32768:
            argVt -= 65536
        ##默认一位小数，dpt = 1
        argV = argVt * 10 ** -dpt
        dcdw.append( argV )
        dbfq.put( dcdw )
        #s_byte = s_byte[ 8: ]
        ##继续解码后面设备响应的字节
        dcdwev = struct.unpack( 'BBBBbBBBBB', s_byte[ 8:18 ] ) 
        dcdwt = []
        dcdwt.append( dcdwev[6] + dcdwev[7] * 256 )
        dcdwt.append( dcdwev[0] + dcdwev[1] * 256 )
        dcdwt.append( dcdwev[2] + dcdwev[3] * 256 )
        crc = dcdwev[8] + dcdwev[9] *256
        wsmk_crc = dcdwt[1] + dcdwt[2] + dcdwev[5] * 256 + dcdwev[4] + dcdwt[0] + addr
        if crc != wsmk_crc % 65536:
            return  ( 1, 8 ) 
        for dcdi in range( 3 ):
            if dcdwt[ dcdi ] >= 32768:
                dcdwt[ dcdi ] -= 65536
            ##默认一位小数，dpt = 1
            dcdwt[ dcdi ] = dcdwt[ dcdi ] * 10 ** -dpt
        #dcdwlst.append( [ '设备 <%2d号温控仪> 响应::   ' % addr ] )
        #dcdwlst.append( [ '参数 <%02XH> 写入值：' % arg ] )
        #dcdwlst.append( time.time() )
        #dcdwlst.append( [ '实时温度：' ] )
        #dcdwlst.append( ['给定温度：'] )
        #dcdwlst.append( ['输出值MV：'] )
        #dcdwlst.append( ['仪表状态：'] )
        dcdwlst = [ 0, 3, addr, arg ]
        dcdArg = dcdwt[0]
        dcdwlst.append( dcdArg )
        dcdPV = dcdwt[1]
        dcdwlst.append( dcdPV )
        dcdSV = dcdwt[2]
        dcdwlst.append( dcdSV )
        dcdMt = dcdwev[4]
        dcdwlst.append( dcdMt )
        dcdAt = dcdwev[5]
        dcdAtt = '{0:07b}'.format( dcdAt )
        dcdAlm = '' 
        for i in range( len( dcdAtt ) ):
            if i % 2:
                dcdAlm += dcdAtt[ i - 1: i + 1 ] + ' '
        dcdwlst.append( dcdAlm )
        dbfq.put( dcdwlst ) 
        #s_byte = s_byte[ 10: ]
        return ( 1, 18 )
    else:
        ##未找到可以解析的帧
        return ( 0, 0 )

def zk( s_byte, dbfq ):
    zkj_addr = s_byte[0]
    if s_byte[2] == 0:
        zkcrc = s_byte[6] + s_byte[7] * 256
        mk_crc = 0xFFFF
        for zki in s_byte[ :6 ]:
            mk_crc ^= zki
            for i in range( 8 ):
                if ( mk_crc & 1 ) == 1:
                    mk_crc >>= 1
                    mk_crc ^= 0xA001
                else:
                    mk_crc >>= 1
        if zkcrc != mk_crc:
            return ( 0, 0 )
        #dcdzkr.append( '设备：<%02d真空计>' % zkj_addr )
        #dcdzkr.append( '<读> 请求::   ' )
        #dcdzkr.append( '寄存器地址：' )
        #设备代号，指令识别码，设备地址，目标寄存器地址，目标寄存器数量
        dcdzkr = [ 1, 0, zkj_addr, 0 ]
        zknum = s_byte[4] * 256 + s_byte[5]
        dcdzkr.append( zknum )
        dbfq.put( dcdzkr )
        return( 1, 8 )
    elif s_byte[2] == 4:
        zkwcrc = s_byte[5] + s_byte[6] * 256
        mk_wcrc = 0xFFFF
        for zki in s_byte[ :5 ]:
            mk_wcrc ^= zki
            for i in range( 8 ):
                if ( mk_wcrc & 1 ) == 1:
                    mk_wcrc >>= 1
                    mk_wcrc ^= 0xA001
                else:
                    mk_wcrc >>= 1
        if zkcrc != mk_wcrc:
            return ( 0, 0 )
        dcdzkrev = struct.unpack( 'BbBb', s_byte[ 3: 5 ] ) 
        for i in [ 1, 3 ]:
            #计算系数B
            if dcdzkrev[i] > 128:
                dcdzkrev[i] -= 256
            #给A加小数点
            while( dcdzkrev[ i - 1 ] >= 10 ):
                dcdzkrev[ i - 1 ] /= 10
        #dcdzkg.append( '设备：<%02d真空计>响应' % zkj_addr )
        #dcdzkg.append( '真空度1：' )
        #dcdzkg.append( '%.2fE%d' % ( dcdzkrev[0], dcdzkrev[1] ) )
        #dcdzkg.append( '真空度2：' )
        #dcdzkg.append( '%.2fE%d' % ( dcdzkrev[2], dcdzkrev[3] ) )
        dcdzkg = [ 1, 1, zkj_addr, s_byte[2] ]
        dcdzkg.append( ( dcdzkrev[0], dcdzkrev[1] ) )
        dcdzkg.append( ( dcdzkrev[2], dcdzkrev[3] ) )
        dbfq.put( dcdzkg )
        return( 1, 7 )
    else:
        return( 0, 0 )



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
    dfname = 'D:\\python_learn\\data\\dcd_intcp2318_' + time.strftime( '%S' ) + '.txt'
    dcdend = 0
    while( sflg() ): ## or s_byte ! = b''
        while( sflg() ): ## or s_byte ! = b''
            flg = sflg()
            if isinstance( srcq, queue.Queue ) :
                if not flg:
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
                    break
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
                    break
                except EOFError:
                    print( '已经解析到文件末尾！' )
                    dcdend = 1
                    break
        #head = skhead( s_byte, zkaddr ) 
        ##有一种情况，本来有一组消息被解析校验正确，可是在这个消息中间又
        ##找到新的消息头（比如516p的两个重复的地址），这种情况概率很小，可以不考虑
        while( True ):
            if len( s_byte ) < 18:
                break
            head = skhead( s_byte, zkaddr ) 
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
                    dbfq.put( s_byte[ :18] )
                    print( s_byte[ :18] )
                    s_byte = s_byte[ 1: ]
            #真空计解析成功，砍掉解析成功部分，继续查找后面
            #解析失败，砍掉这个head，继续查找后面
            elif head[0] == 2: 
                dzflag = zk( s_byte, dbfq )
                if dzflag[0]:
                    s_byte = s_byte[ dzflag[1]: ]
                else:
                    dbfq.put( s_byte[ :18] )
                    print( s_byte[ :18] )
                    s_byte = s_byte[ 1: ]
        while( 1 ):
            try:
                lll = dbfq.get( block = 0 )
                #for illl in lll:
                #if isinstance( lll, bytes ):
                    #print( lll )
                print( lll )
                df = open( dfname, 'a' )
                df.write( str( lll ) + '\n' )
                df.close()
            except queue.Empty:
                break
        if dcdend == 1:
            break




if __name__ == '__main__':
    ctrlq = queue.Queue()
    i_dcd( ctrlq,srcf='d:\\python_learn\\jiankongchengxu\\intcp231840.ire' )
    #fname = 'D:\\python_learn\\jiankongchengxu\\intcp000457.ire'
    input( 'Press to End!' )






