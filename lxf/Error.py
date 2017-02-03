# -- coding: utf-8 --
def foo( s ):
    #r = some_function()
    r = 10 / int( s ) 
    if r == ( -1 ): 
        return ( -1 )
    return r
def bar( s ):
    r = foo( s )
    if r == ( -1 ):
        print( 'Error' )
    else:
        return foo( s ) * 2 

try:
    print( 'try...' )
    r = 10 / int( '3' ) 
    print( 'result:', r )
except ValueError as e:
    print( 'ValueError:', e)
except ZeroDivisionError as e:
    print( 'except:', e )
else:
    print( 'no error!')
finally:
    print( 'finally...:' )
print( 'end' )

try:
    foo( 3 )
except ValueError as e:
    print( 'ValueError' )
except UnicodeError as e:
    print( 'UnicodeError' )

def  main():
    try:
        bar( '0' )
    except Exception as e:
        print( 'Error:', e )
    finally:
        print( 'finally...' )
if __name__ == '__main__':
    main()
