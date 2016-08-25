# -- coding: utf-8 --

import urllib.request
import random
import os



def url_open( url ):
    req = urllib.request.Request( url )
#1#
    print( url,1111 )
    req.add_header( 'Host', 'jandan.net' )
    req.add_header( 'User_Agent', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:47.0) Gecko/20100101 Firefox/47.0' )
    req.add_header( 'Accept', 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8' )
    req.add_header( 'Accept-Language', 'zh-CN,en-US;q=0.7,en;q=0.3' )
    req.add_header( 'Accept-Encoding', 'gzip, deflate' )
    req.add_header( 'Referer', 'http://jandan.net/' )
    req.add_header( 'Cookie', '2084841798=0678WR6l6mGEnyK%2FrJA%2B7Xv7PDLS7lpGXcrAIdg2Lw; 2084841798=f8c1Dc8J3X8y7AQQLhXlea8EhSKp4uMYOmM7ZA3yBA; Hm_lvt_fd93b7fb546adcfbcf80c4fc2b54da2c=1471167750,1471167900,1471175839,1471178825; _ga=GA1.2.1320066395.1471167750; jdna=596e6fb28c1bb47f949e65e1ae03f7f5#1471179630221; Hm_lpvt_fd93b7fb546adcfbcf80c4fc2b54da2c=1471179634' )
    req.add_header( 'Connection', 'keep-alive' )
    req.add_header( 'Cache-control', 'max-age=0' )
    response = urllib.request.urlopen( req )
#1#
    print( url,2222 )
    html = response.read()
    return html

def get_pages( url ):
#1#    print( url )
#    html = url_open( 'http://www.tianya.cn/77385606' ).decode( 'utf-8' )
#1#    print( html )
#    a = html.find( 'current-comment-page' ) + 23
#    b = html.find( ']', a )

#    print( html[ a:b ] )
#    return html[ a:b ] 
    return 2091

def find_img( url):
    html = url_open( url ).decode( 'utf-8' )
    img_addr = [  ]


    a = html.find( 'img src=' )
    while a != -1:
        b = html.find( '.jpg', a, a + 255 )
        if b != -1:
            img_add.append[ html[ a + 9 : b + 4 ] ]
        else:
            b = a + 9
        a = html.find( 'img src=', b )

    for each in img_addr:
        print( each )
def save_img( folder, img_addr ):
    pass

def download_mm( folder = 'oomm', page = 10 ):
    os.mkdir( folder )
    os.chdir( folder )
    url = 'http://jiandan.net/ooxx/'
    page_num = int( get_pages( url ) )
    
    for i in range( page ):
        page_num -= i
        page_url = url + 'page-' + str( page_num ) + '#comments'
        img_addr = find_img( page_url )
        save_img( folder, img_addr ) 

if __name__ == '__main__':
    download_mm()


