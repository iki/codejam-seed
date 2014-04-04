codejam-seed
============

Seed for Google Code Jam

Getting started
---------------

1. Edit your google account address in `.bin/gcj/config/user_config.py`


Sample usage
------------

1. Choose contest at https://code.google.com/codejam/contests.html,
   e.g. 2010 Qualification https://code.google.com/codejam/contest/433101/dashboard

2. Copy it's ID from URL: 433101.

3. Compete:

  ```
  export PATH=$PWD/.bin;$PATH

  cd 2010-qualification

  gcj-init-contest 433101

  vim a.py # hack your code

  gcj-download-input a small 0

  a.py A-small-0.in  # run your code

  gcj-submit-solution a small 0

  ```
