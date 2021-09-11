#!/usr/bin/env bash
set -euo pipefail

./simple-test-selenoid.py 15 chrome 92.0 &
./simple-test-selenoid.py 10 firefox 91.0 &
./simple-test-selenoid.py 20 opera 78.0 &
./simple-test-selenoid.py 15 chrome 92.0 &
./simple-test-selenoid.py 10 firefox 91.0 &
./simple-test-selenoid.py 20 chrome 93.0 &
./simple-test-selenoid.py 15 chrome 92.0 &
./simple-test-selenoid.py 10 opera 77.0 &
./simple-test-selenoid.py 20 chrome 93.0 &
./simple-test-selenoid.py 15 chrome 92.0 &
./simple-test-selenoid.py 10 firefox 92.0 &
./simple-test-selenoid.py 20 chrome 93.0 &
./simple-test-selenoid.py 15 chrome 92.0 &
./simple-test-selenoid.py 10 firefox 92.0 &
./simple-test-selenoid.py 20 chrome 93.0 &
