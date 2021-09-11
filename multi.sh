#!/usr/bin/env bash
set -euo pipefail

HUB_URL='http://david.localdomain:4444/wd/hub'

./simple-test.py 15 chrome 93.0 "${HUB_URL}" &
./simple-test.py 10 firefox 92.0 "${HUB_URL}" &
./simple-test.py 20 MicrosoftEdge 94.0 "${HUB_URL}" &
