#!/bin/sh

set -ex

NPM=$(devpacks pkg-path node -p npm)

"$NPM" install
