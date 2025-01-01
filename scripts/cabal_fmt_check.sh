#!/bin/sh

set -ex

cabal run -- cabal-fmt --check ./devpacks-site.cabal
