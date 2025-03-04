#!/bin/sh

set -ex

NODE=$(devpacks pkg-path node -p node)

"$NODE" ./node_modules/.bin/prettier --write .

echo OK
