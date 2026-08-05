#!/bin/bash

cd releases

for f in * ; do
  echo $f
  gh release view $f >/dev/null 2>&1 || gh release create $f -n $f
  gh release upload --clobber $f $f/*.deb
done
