from sys import argv

script, user_name = argv
prompt = '> '

print( 'Hi %s, I\'m the %s script.' % ( user_name, script ) )
print( 'I\'d like to ask you a few questions.')
print( 'Do you like me {}'.format( user_name ) )
likes = input( prompt )

print( 'Where do you lives, {}?'.format( user_name ) )
lives = input( prompt )

print( 'What kind of computer do you have?' )
computer = input( prompt )

print('''
        Alright, so you said {mmm} about liking me.
        You live in {mm}.Not sure where that is.
        And you have a {m} computer. Nice.
        '''.format( mmm = likes, mm = lives, m = computer ) )

