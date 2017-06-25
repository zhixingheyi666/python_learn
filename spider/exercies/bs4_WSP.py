# -*- coding:utf-8 -*-
from urllib.request import urlopen
from bs4 import BeautifulSoup
import re, pdb, os, random

#为自定义模块添加搜索路径
import sys
sysSf = 'D:\\python_learn\\sysFc'
sys.path.append(sysSf)


from logSf10 import crLog
logger = crLog()
logger.info('Succeed!!') 
from fRcd import fRecord

fgx = '\n======================================分割线======================================\n'

urlst = [ "https://www.yandex.com",
            "http://www.baidu.com",
            "http://www.1688.com",
            "https://www.zhihu.com/question/20271508",
            "http://www.cnblogs.com/wupeiqi/articles/4731930.html",
            "http://www.baidu.com/s?",
            'http://news.dbanotes.net',
            'http://opac.nl.cn',
            'http://www.zhcw.com',
            'http://www.zhihu.com'
            ]

def getHtml( url ):
    #pdb.set_trace()
    html = urlopen( url )
    bsObj = BeautifulSoup(html,'html.parser')
    #bsObj = BeautifulSoup(html)
    return bsObj

def getLinks( html,rule = re.compile('.*'),norepeat = True ):
    links = [] 
    for link in html.findAll('a',href = rule):
        if 'href' in link.attrs:
            tlink = link.attrs['href']
            tsplit = tlink.split('/')
            #logger.info(len(tsplit))
            if len(tsplit) != 3:
                #logger.info(tsplit)
                continue
            if tlink not in links:
                links.append(link.attrs['href'])
                #logger.info(tlink)
                #print(links[-1])
    #pdb.set_trace()
    return links

def papa( urlHead,urlTail ):
    #rule = re.compile('^\/people\/.*\/following')
    #设置是否清空记录文件，fRcord 成功执行返回 1 ，not 返回值，表示下次不清空
    mcls = 1
    url = urlHead + urlTail
    rule = re.compile('^/people/[^/]*')
    html = getHtml(url)
    people = getLinks(html,rule)
    #pdb.set_trace()
    count = 0
    while len(people):
        while 1: 
            try:
                index = random.randint(0,len(people) - 1 )
                fUrl = urlHead + people[index] + '/following'
                html = getHtml(fUrl)
                break
            except Exception as e:
                logger.warning(fgx+fUrl)
                pdb.set_trace()
                try:
                    people.pop(index)
                except Exception as ee:
                    logger.warning('Failed to people.pop(%r)' % index)
                    pdb.set_trace()
        new = getLinks(html,rule)
        tnew = []
        for ni in new:
            if ni not in people:
                people.append(ni)
                tnew.append(ni)
                logger.info(ni)
        #设置是首次调用清空记录文件
        fRecord(tnew,cls = mcls)    
        if mcls:
            mcls = 0
        count += 1
        if not count % 100:
            fRecord(fgx,iIter = False,cls = mcls)    
            pdb.set_trace()
        
            

if __name__ == '__main__':
    questionUrl = ['/question/53030354',
                    '/people/xu-jia-nan-3-31',
                    '/people/xu-jia-nan-3-31/following']
    #bsObj = getHtml(urlst[-1] + questionUrl[-1])
    papa(urlst[-1], questionUrl[-1])


    
"""
    rule = re.compile('^(\/people\/).*')
    links = getLinks(bsObj,rule)
    fRcord = 'D:\\桌面\\tempStdout.out'
    frSize = os.path.getsize(fRcord) 
    with open(fRcord,'a') as tff:
        if frSize > 1024 * 10:
            tff.truncate()
        for il in links:
            tff.write(il+'\n')
        tff.write(fgx)

string = re.compile('\.\.\/img\/gifts/img.*\.jpg')
^\/people\/.*
^\/people\/((?!:).)*$
    """



