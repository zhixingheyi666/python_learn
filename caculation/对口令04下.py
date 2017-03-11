# -*- coding: utf-8 -*-
"""
"""

import random
import pdb 

l_100 = list(range(1,100))
Imap = list(map(lambda x: (x,100-x),l_100))
pdb.set_trace()
Iimap = []
while len(Imap)>0:
    idx = random.randint(0,len(Imap) - 1)
    Iimap.append(Imap[idx])
    Imap.pop(idx)

l_1000 = list(range(10,990))
I0map = list(map(lambda x: (x,1000-x),l_1000))
I0imap = []
while len(I0map)>0:
    idx = random.randint(0,len(I0map) - 1)
    I0imap.append(I0map[idx])
    I0map.pop(idx)
f = open( '对口令.txt', 'w')
c1, c2 = 0, 0
pdb.set_trace()
while c1 < len(Iimap) - 1 and c2  < len(I0imap) - 3:
    f.write('@' + str(Iimap[c1]))
    c1 += 1
    ln = [1,2,3]
    for li in ln:
        f.write('@' + str(I0imap[c2]))
        c2 += 1
if f:
    f.close()
