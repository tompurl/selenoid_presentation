#!/usr/bin/env bash
set -euo pipefail

source ./browser_configs

USAGE="Usage: $0 http://hub_url:4444/wd/hub"

die () {
    >&2 echo "$1"
    exit 1
}

# sanity check
[ "$#" -ne 1 ] && die "$USAGE"

HUB_URL="$1"

./simple-test.py 15 "$BROWSER_ONE_NAME" "$BROWSER_ONE_VERSION_ONE" "$HUB_URL" &
./simple-test.py 10 "$BROWSER_TWO_NAME" "$BROWSER_TWO_VERSION_ONE" "$HUB_URL" &
./simple-test.py 20 "$BROWSER_THREE_NAME" "$BROWSER_THREE_VERSION_TWO" "$HUB_URL" &
./simple-test.py 15 "$BROWSER_ONE_NAME" "$BROWSER_ONE_VERSION_ONE" "$HUB_URL" &
./simple-test.py 10 "$BROWSER_TWO_NAME" "$BROWSER_TWO_VERSION_ONE" "$HUB_URL" &
./simple-test.py 20 "$BROWSER_ONE_NAME" "$BROWSER_ONE_VERSION_TWO" "$HUB_URL" &
./simple-test.py 15 "$BROWSER_ONE_NAME" "$BROWSER_ONE_VERSION_ONE" "$HUB_URL" &
./simple-test.py 10 "$BROWSER_THREE_NAME" "$BROWSER_THREE_VERSION_ONE" "$HUB_URL" &
./simple-test.py 20 "$BROWSER_ONE_NAME" "$BROWSER_ONE_VERSION_TWO" "$HUB_URL" &
./simple-test.py 15 "$BROWSER_ONE_NAME" "$BROWSER_ONE_VERSION_ONE" "$HUB_URL" &
./simple-test.py 10 "$BROWSER_TWO_NAME" "$BROWSER_TWO_VERSION_TWO" "$HUB_URL" &
./simple-test.py 20 "$BROWSER_ONE_NAME" "$BROWSER_ONE_VERSION_TWO" "$HUB_URL" &
./simple-test.py 15 "$BROWSER_ONE_NAME" "$BROWSER_ONE_VERSION_ONE" "$HUB_URL" &
./simple-test.py 10 "$BROWSER_TWO_NAME" "$BROWSER_TWO_VERSION_TWO" "$HUB_URL" &
./simple-test.py 20 "$BROWSER_ONE_NAME" "$BROWSER_ONE_VERSION_TWO" "$HUB_URL" &
