#!/bin/sh

set -ex

cabal run -- ormolu --mode check `find src src-exe -name '*.hs'`
