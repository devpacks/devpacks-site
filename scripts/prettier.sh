#!/bin/sh

set -ex

./node_modules/.bin/prettier --write .

echo OK
