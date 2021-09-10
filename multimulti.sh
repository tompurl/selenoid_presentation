#!/usr/bin/env bash
set -euo pipefail

./simple-test.py 15 chrome 91.0 &
./simple-test.py 10 firefox 90.0 &
./simple-test.py 20 opera 77.0 &
./simple-test.py 15 chrome 91.0 &
./simple-test.py 10 firefox 90.0 &
./simple-test.py 20 chrome 92.0 &
./simple-test.py 15 chrome 91.0 &
./simple-test.py 10 opera 76.0 &
./simple-test.py 20 chrome 92.0 &
./simple-test.py 15 chrome 91.0 &
./simple-test.py 10 firefox 91.0 &
./simple-test.py 20 chrome 92.0 &
./simple-test.py 15 chrome 91.0 &
./simple-test.py 10 firefox 91.0 &
./simple-test.py 20 chrome 92.0 &
