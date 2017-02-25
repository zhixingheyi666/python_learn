# -*- coding: utf-8 -*-

import urllib.request
import urllib.parse
import json
import time

while True : 
    content = input( '请输入需要翻译的内容：' ) 
    if content == '':
        break
    url = 'http://fanyi.youdao.com/translate?smartresult=dict&smartresult=rule&smartresult=ugc&sessionFrom=null'
    data = {
            'type':'AUTO',
            'i': content,        'doctype':'json',
            'xmlVersion':'1.8',
            'keform':'fanyi.web',
            'ue':'UTF-8',
            #'action':'FY_BY_CLICKBUTTON'
            'typoResult':'true'
            }
    data = urllib.parse.urlencode( data ).encode( 'utf-8' )
    response = urllib.request.urlopen( url, data )
    html = response.read().decode( 'utf-8' )
    time.sleep(1)
#print( html )
    target = json.loads( html )
    print( target['translateResult'][0][0]['tgt'] )
print( 'Thans, Goodbye! 谢谢，再见！' )


