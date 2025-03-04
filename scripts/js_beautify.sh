#!/bin/sh

set -ex

NODE=$(devpacks pkg-path node -p node)

"$NODE" ./node_modules/.bin/js-beautify --replace --config jsbeautifyrc --type html `find . -name '*.html' -not -path "./_site/*"`

echo OK
