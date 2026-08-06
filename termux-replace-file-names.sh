#!/bin/bash

find releases-uploaded -name '*+*' -printf "%f\n" | sort -u > files-pluses.txt

cat files-pluses.txt | while read FNAME; do
  OLDNAME=$(echo "${FNAME}" | sed -E 's/[^-_.a-zA-Z0-9]/./g')
  echo "${OLDNAME} -> ${FNAME}"
  for f in dists/*/*/*/Packages; do
    echo "$f"
    sed -i -E "s/${OLDNAME}/${FNAME}/g" "$f"
  done

done

for f in dists/*/*/*/Packages; do
  echo "$f"
  sed -i -E '/^Filename: / s/[^-_.a-zA-Z0-9+ /]/./g' "$f"
  sed -i -E 's/^Filename. /Filename: /g' "$f"
done

../termux-apt-repo/termux-apt-repo --sign --use-hard-links --github-releases --no-contents-xz --add-existing-repo \
  debs-main . stable main

../termux-apt-repo/termux-apt-repo --sign --use-hard-links --github-releases --no-contents-xz --add-existing-repo \
  debs-x11 . x11 main

../termux-apt-repo/termux-apt-repo --sign --use-hard-links --github-releases --no-contents-xz --add-existing-repo \
  debs-root . root stable
