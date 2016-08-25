
i = 0
addr = 0
write_value = 0
print( '本程序所需输入值，如无特特别说明，均为10进制\n要求输入16进制数的，直接输入，不用带H或者0x等标记\n' )
while 1:
    while 1:
        readnum = input( '请输入读取参数的代号（16进制）：\n-1 切换写校验计算：\n' )
        readnum = int( readnum, 16 )
#1#
        if readnum == -1:
            i = 0
            break
        pre_addr = input( '请输入设备地址，回车使用上次输入：%02xH\n默认地址：00H\n' % addr )
        if pre_addr != '':
            addr = int( pre_addr )
        crc_l = 82 + addr
        crc_h = readnum 
        print( '序列%3d：\t参数代号：%02xH \t\tAddr：%02xH \t\t校验码：%02xH %02xH\n'\
                % ( i, readnum, addr, crc_l, crc_h ) )
        h_addr = addr + 128 
        print( '指令编码：\n%02x%02x 52 %02x 0000 %02x%02x\n' % ( h_addr, h_addr, readnum, crc_l, crc_h )  )
        print( '%02x%02x52%02x0000%02x%02x\n\n' % ( h_addr, h_addr, readnum, crc_l, crc_h )  )
        i += 1
    if input( '结束程序请按0，否则进入写指令计算：\n' ) =='0':
        break
    while 1:
        writenum = input( '请输入写入参数的代号（16进制）：\n-1 切换读校验计算：\n' )
        writenum = int( writenum, 16 )
#1#
        if writenum == -1:
            i = 0
            break
        pre_addr = input( '请输入设备地址，回车使用上次输入：%02xH\n默认地址：00H\n' % addr )
        if pre_addr != '':
            addr = int( pre_addr )
        write_v = input( '请输入要写入的参数值，回车使用上次输入：%02xH\n默认值：0000H\n' % addr )
        if write_v != '':
            write_value = int( write_v )
            ## 要写入的参数值，同样是低位在前，高位在后，下面程序段对其进行处理
            if write_value < 0:
                write_value_out = ( ( 65536 + write_value ) % 256 ) * 256 + ( 65536 + write_value )// 256
            else:
                write_value_out = write_value % 256 * 256 + write_value // 256
#2#
            print( write_value_out )
            print( hex( write_value_out ) )
        crc = writenum * 256 + 67 + write_value + addr
        crc = crc % 65536
        crc_h = crc // 256
        crc_l = crc % 256
#1#        print( '%06x' % crc_l )
        print( '序列%3d：\t参数代号：%02xH \t\t写入值：%d\t\tAddr：%02xH \t\t校验码：%02xH %02xH\n'\
                % ( i, writenum, write_value, addr, crc_l, crc_h ) )
        h_addr = addr + 128 
        print( '指令编码：\n%02x%02x 43 %02x %04x %02x%02x\n' % ( h_addr, h_addr, writenum, write_value_out, crc_l, crc_h )  )
        print( '%02x%02x43%02x%04x%02x%02x\n\n' % ( h_addr, h_addr, writenum, write_value_out, crc_l, crc_h )  )
        i += 1
    if input( '结束程序请按0，否则进入读指令计算：\n' ) =='0':
        break
print( '谢谢使用，再见！' )
