import random
secret = random.randint( 1, 10 )
print( '------------------我爱人工智能------------------------' )
temp = input( '不妨猜一下我现在心中想的数字：' )
i = 0
cishu = 3
while( i < cishu ):
    i = i + 1
    guess = int( temp )
    if guess > secret :
        print( '哥，大了大了~~~' )
    else:
        if guess == secret:
            print( '哇，你是小甲鱼肚子里的蛔虫吗？' )
            print( '哼，猜中了也没有奖励' )
            print( '游戏结束，不玩了~~' )
            i = cishu + 1
            break
        else:
            print( '嘿，小了，小了！' )
    if i < cishu: 
        temp = input( '啊呀，猜错了，请重新输入吧：')
if i != cishu + 1:
    print( '看来咱们没默契哦！' )


