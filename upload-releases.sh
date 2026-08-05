#!/bin/bash

mkdir -p releases-uploaded
cd releases

for f in * ; do
  echo $f
  gh release view $f >/dev/null 2>&1 || gh release create $f -n $f || exit 1
  gh release upload --clobber $f $f/*.deb || exit 1
  mv $f ../releases-uploaded/ || exit 1
done
