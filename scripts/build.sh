#!/bin/bash

set -ex

GHC=$(devpacks pkg-path ghc -p ghc)
CABAL=$(devpacks pkg-path haskell_cabal_install -p cabal)
PKG_CONFIG=$(devpacks pkg-path pkgconfig -p pkg-config)

ZLIB_PATH=$(devpacks pkg-path zlib)

"$GHC" --version
"$CABAL" --version

export PKG_CONFIG_PATH="${ZLIB_PATH}"/lib/pkgconfig

"$CABAL" update
"$CABAL" --with-ghc="$GHC" --with-pkg-config="$PKG_CONFIG" build all --ghc-options='-Werror'
