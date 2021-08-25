#!/usr/bin/env bash
set -ex

export LC_ALL=C.UTF-8
export LANG=C.UTF-8

LANG=(en-us ja-jp)
ROOT=$PWD

for lang in ${LANG[@]}; do
  cd "$ROOT/$lang"
  mkdocs build
  mkdir -p "$ROOT/site/$lang"
  cp -r ./site/* "../site/$lang"
done

cd "$ROOT"
cp ./site/en-us/404.html ./site/404.html

echo "Build Done"
