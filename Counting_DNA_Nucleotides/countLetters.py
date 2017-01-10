#! /usr/bin/env python

import sys

L={}  # Hash of Letters

for line in sys.stdin:
    for char in list(line):
        if char in L.keys():
            L[char]=L[char]+1
        else:
            L[char]=1
#    sys.stdout.write(line)

for k in sorted(L.keys()):
    print k,'\t',L[k]
