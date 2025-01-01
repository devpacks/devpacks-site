#!/bin/sh

set -ex

cabal run -- cabal-fmt --inplace ./devpacks-site.cabal

echo OK
