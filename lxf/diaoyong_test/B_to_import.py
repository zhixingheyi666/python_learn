# -- coding: utf-8 --
##测试将在B文件中掉用A文件的一个函数
##但是B文件不会import A 文件
##A文件会import B文件，并且
##调用B文件中的函数,看看是否成功
class lili( object ):
    def __init__( self, love):
        self.male = 'wangwenqiang'
        self.love = love
        print( 'invoking A.love', '---->', self.male )
    def make( self , female):
        self.love( self.male, female )
