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

2. Copy contest ID from URL: `433101`

3. Compete:

  ```shell

  export PATH=$PWD/.bin;$PATH

  cd 2010-qualification

  gcj-init 433101
    # gcj_init_contest

  vim a.py # hack your code

  gcj-get a small 0
    # gcj_download_input

  a.py -dt A-small-0.in
    # run your code, generate A-small-0.out

  gcj-submit a small 0
    # gcj_submit_solution

  ```
