#!/bin/sh

# All packages that are bigger than 30 megabytes
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
oidn
oidn
openjdk-21-source
foundry
openjdk-25-source
dotnet-sdk-9.0
openjdk-17-source
erlang
wasi-libc
mono-libs
dotnet-sdk-8.0
emacs
jellyfin-server
ovmf
emscripten-llvm
swift-sdk-arm
awscli
swift-sdk-x86-64
rust-docs
swift-sdk-aarch64
python-torch
golang
codon
forgejo
gitea
zrok
llvm-mingw-w64-ucrt
openlist
tinymist
rabbitmq-server
clang
libllvm
keybase
'

for PKG in $LARGE_PACKAGES; do
  echo === $PKG ===
  for ARCH in aarch64 arm i686 x86_64; do
    git lfs track "dists/stable/main/binary-${ARCH}/${PKG}_*"
  done
done
