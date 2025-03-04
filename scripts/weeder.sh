#!/bin/sh

set -ex

GHC=$(devpacks pkg-path ghc -p ghc)
CABAL=$(devpacks pkg-path haskell_cabal_install -p cabal)
PKG_CONFIG=$(devpacks pkg-path pkgconfig -p pkg-config)
ZLIB_PATH=$(devpacks pkg-path zlib)
export PKG_CONFIG_PATH="${ZLIB_PATH}"/lib/pkgconfig

"$CABAL" --with-ghc="$GHC" --with-pkg-config="$PKG_CONFIG" run -- weeder
