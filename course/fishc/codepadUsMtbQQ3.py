#codepad.org/UsMtbQQ3
import threading
import time
import Queue
from Tkinter import *

## Create main window
root = Tk()

## Communication queue
commQueue = Queue.Queue()

## Function run in thread
def timeThread():
    curTime = 0
    while 1:
        ## Each time the time increases, put the new value in the queue...
        commQueue.put(curTime)
        ## ... and generate a custom event on the main window
        try:
            root.event_generate('<<TimeChanged>>', when='tail')
        ## If it failed, the window has been destoyed: over
        except TclError:
            break
        ## Next
        time.sleep(1)
        curTime += 1

## In the main thread, do usual stuff
timeVar = IntVar()
Label(root, textvariable=timeVar, width=8).pack()

## Use a binding on the custom event to get the new time value
## and change the variable to update the display
def timeChanged(event):
    timeVar.set(commQueue.get())

root.bind('<<TimeChanged>>', timeChanged)

## Run the thread and the GUI main loop
th=threading.Thread(target=timeThread)
th.start()

mainloop()
