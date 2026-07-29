#!/bin/sh

# All packages that are bigger than 50 megabytes
LARGE_PACKAGES='
ghc
scala
seerr
gradle
rust
swift
openjdk-25
grafana
openjdk-21
openfoam
openjdk-17
gap-packages
libllvm-static
dart
kotlin
dotnet-sdk-dbg-8.0
rustc-dev
dotnet-sdk-10.0
stockfish
flang
ndk-multilib
wasmer
jadx
geth-utils
zig
jython
'

for PKG in $LARGE_PACKAGES; do
  echo === $PKG ===
  for ARCH in aarch64 arm i686 x86_64; do
    git lfs track "dists/stable/main/binary-${ARCH}/${PKG}_*"
  done
done
