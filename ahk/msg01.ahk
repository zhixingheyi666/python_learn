iAdd(x,y)
{
    return x + y    ;加法
}

MsgBox % "The answer is: " . iAdd(3,2)

ivar := "My variables!"

MsgBox 1:The value in  the variable named Var is %ivar%.
; .是连接符号，必须用至少一个空格与前后连接的内容间隔开，多个空格等同于一个空格。
MsgBox % "2:The value in  the variable named Var is " .    ivar . "." 
