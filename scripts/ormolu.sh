#!/bin/sh

set -ex

cabal run -- ormolu --mode inplace `find src src-exe -name '*.hs'`

echo OK
