""" Welcome to Code Jam

:Abstract: Solution to Google Code Jam 2010 qualification
:Authors:  iki
:Contact:  jan.killian at (g)mail.com

.. contents::

Problem statement
=================

Input
-----

Output
------

Limits
------

Doctest
=======

>>> test(
...   testlabel='sample via parse()',
...   testinput='''4
... 1 0
... 1 1
... 4 0
... 4 47
... ''')  #doctest: +NORMALIZE_WHITESPACE
Case #1: OFF
Case #2: ON
Case #3: OFF
Case #4: ON

"""
__docformat__ = 'restructuredtext en'

import sys, os.path
sys.path.insert(0, os.path.abspath('../.lib'));

from codejam import *

import string

showbits_symbols_default = string.maketrans('01', '.+')

def showbits(n, minlength=0, symbols=showbits_symbols_default):
    b = bin(n)[:1:-1]
    if minlength and minlength > len(b):
        b += '0' * (minlength - len(b))
    if symbols:
        b = b.translate(symbols)
    return b

def solve_slow(n, k):
    K = k

    switched = 0
    powered  = 1
    mask     = 2**n - 1

    while k:
        k -= 1
        switched ^= powered & mask

        s = switched
        powered = 1
        while s & 1:
            powered = 2*powered + 1
            s >>= 1

        if log.debug:
            log.debug('%10d: [%s] [%s]' % (
                K-k, showbits(switched, n), showbits(powered, n+1)))

    return powered & (2**n)

def solve_fast(n, k):
    bits = 2 ** n
    on = (k % bits == bits - 1)

    if log.debug:
        log.debug('bits = 2 ** %d = %d; steps = %d = %d * %d + %d; %s' % (
            n, bits, k, k / bits, bits, k % bits, on))

    return on

solve = solve_fast

def parse(fi):
    return map(int, fi.next().strip().split())

def format(r):
    return r and 'ON' or 'OFF'

if __name__ == '__main__':
    main(solve, parse, format)
