#!/bin/sh

set -ex

./node_modules/.bin/js-beautify --replace --config jsbeautifyrc --type html `find . -name '*.html' -not -path "./_site/*"`

echo OK
