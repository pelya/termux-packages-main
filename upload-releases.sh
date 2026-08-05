#!/bin/bash

mkdir -p releases-uploaded
cd releases
COUNT=0

for f in * ; do
  echo $f
  gh release view $f >/dev/null 2>&1 || gh release create $f -n $f || exit 1
  gh release upload --clobber $f $f/*.deb || exit 1
  mv $f ../releases-uploaded/ || exit 1
  let COUNT++
  if [ $COUNT -ge 40 ]; then
    echo "Sleeping 1 hour because of Github rate limits"
    COUNT=0
    sleep 3600
  fi
done
