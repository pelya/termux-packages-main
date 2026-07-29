#!/bin/bash

curl https://packages.termux.dev/apt/termux-main/dists/stable/main/binary-aarch64/Packages \
  | grep -E -o '^(Package|Size):.*'  \
  | tac \
  | paste -d " "  - -  \
  | sed 's/Size: //g' \
  | sort -r -n > package-sizes-main.txt

curl https://packages.termux.dev/apt/termux-x11/dists/x11/main/binary-aarch64/Packages \
  | grep -E -o '^(Package|Size):.*'  \
  | tac \
  | paste -d " "  - -  \
  | sed 's/Size: //g' \
  | sort -r -n > package-sizes-x11.txt

curl https://packages.termux.dev/apt/termux-root/dists/root/stable/binary-aarch64/Packages \
  | grep -E -o '^(Package|Size):.*'  \
  | tac \
  | paste -d " "  - -  \
  | sed 's/Size: //g' \
  | sort -r -n > package-sizes-root.txt
