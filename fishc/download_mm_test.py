# -*- coding: utf-8 -*-

import urllib.request
req = urllib.request.Request( 'http://www.tianya.cn/77385606' )
#http://www.tianya.cn/77385606
response = urllib.request.urlopen( req )
cat_img = response.read()
print( cat_img )

with open( 'cat_500_600.jpg', 'wb' ) as f:
    f.write( cat_img )

"""
    Host: fanyi.youdao.com
    User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:47.0) Gecko/20100101 Firefox/47.0
    Accept: application/json, text/javascript, */*; q=0.01
    Accept-Language: zh-CN,en-US;q=0.7,en;q=0.3
    Accept-Encoding: gzip, deflate
    Content-Type: application/x-www-form-urlencoded; charset=UTF-8
    X-Requested-With: XMLHttpRequest
    Referer: http://fanyi.youdao.com/
    Content-Length: 124
    Cookie: OUTFOX_SEARCH_USER_ID=-94941191@39.72.54.2; YOUDAO_MOBILE_ACCESS_TYPE=1; JSESSIONID=abc23ZOehVRVkheqSE9zv; SESSION_FROM_COOKIE=fanyiweb; _ntes_nnid=4f9fdf005297b8e038cb5678ff7dab83,1470984009433; ___rl__test__cookies=1470984173463; OUTFOX_SEARCH_USER_ID_NCOO=2054681256.3588464
    Connection: keep-alive
"""
