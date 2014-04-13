""" Solution to Google Code Jam 2014 Qualification Problem C

Problem: https://code.google.com/codejam/contest/2974486/dashboard#s=p2

>>> test(
...   testlabel='sample via parse()',
...   testinput='''5
... 5 5 23
... 3 1 1
... 2 2 1
... 4 7 3
... 10 10 82
... ''')  #doctest: +NORMALIZE_WHITESPACE
Case #1:
Impossible
Case #2:
c
.
*
Case #3:
Impossible
Case #4:
......*
.c....*
.......
..*....
Case #5:
**********
**********
**********
****....**
***.....**
***.c...**
***....***
**********
**********
**********

"""

import sys, os.path
sys.path.insert(0, os.path.abspath('../.lib'));

from codejam import *

def solve(R, C, M):
  assert 0 <= M < R * C

def parse(fi):
  return map(int, fi.next().strip().split())

def format(r):
  return r

if __name__ == '__main__':
    main(solve, parse, format)
