#!/bin/bash

for f in dists/*/*/*/Packages; do
  echo "$f"
  sed -i -E '/^Filename: / s/[^-_.a-zA-Z0-9/ ]/./g' "$f"
  sed -i -E 's/^Filename. /Filename: /g' "$f"
done

../termux-apt-repo/termux-apt-repo --sign --use-hard-links --github-releases --no-contents-xz --add-existing-repo \
  debs-main . stable main

../termux-apt-repo/termux-apt-repo --sign --use-hard-links --github-releases --no-contents-xz --add-existing-repo \
  debs-x11 . x11 main

../termux-apt-repo/termux-apt-repo --sign --use-hard-links --github-releases --no-contents-xz --add-existing-repo \
  debs-root . root stable
