# -*- coding: utf-8 -*-

import urllib.request
import random
m_url = 'http://www.whatismyip.com.tw'
ip_list = [
        '112.255.97.105:8118',
        '113.25.67.144:8118',
        '183.131.76.27:8888',
        '222.170.17.74:2226',
        '180.142.128.118:2226',
        '218.244.149.184:8888'
        ]

proxy_support = urllib.request.ProxyHandler ( { 'http': random.choice( ip_list ) } ) 
opener = urllib.request.build_opener( proxy_support )
opener.addheaders = [ ( 'User-Agent','Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36 QIHU 360SE' ) ]

response = opener.open( m_url )
html = response.read().decode( 'utf-8' )
print( html )
