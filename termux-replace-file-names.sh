#!/bin/bash

for f in dists/*/*/*/Packages; do
  echo "$f"
  sed -i -E '/^Filename: / s/[^-_.a-zA-Z0-9/ ]/./g' "$f"
  sed -i -E 's/^Filename. /Filename: /g' "$f"
done
