# -- coding: utf-8 --

import threading, time

locka = threading.Lock()
lockb = threading.Lock()

count = 0

def fa():
    global count
    count += 1
    print( 'a>>>', count )

def fb():
    global count
    count += 1
    print( 'b>>>', count )

def fab():
    locka.acquire()
    try:
        print( 'locka+ab+fa' )
        fa()
        time.sleep( 1 )
        lockb.acquire()
        try:
            print( 'lockb+ab+fb' )
            fb()
        finally:
            lockb.release()
    finally:
        locka.release()


def fba():
    lockb.acquire()
    try:
        print( 'lockb+ba+fb' )
        fb()
        time.sleep( 1 )
        locka.acquire()
        try:
            print( 'lockb+ba+fb' )
            fa()
        finally:
            locka.release()
    finally:
        lockb.release()


t1 = threading.Thread( target = fab )
t2 = threading.Thread( target = fba )

t1.start()
t2.start()
t1.join()
t2.join()

print( 'End' )
