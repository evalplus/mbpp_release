#!/bin/bash

version=$1

if [ -z "$version" ]; then
  echo "Usage: release.sh <version>"
  exit 1
fi

git tag -a $version -m "MBPP+ $version"
gh release create $version $(dirname $0)/*.jsonl.gz --title "MBPP+ $version" --notes "MBPP+ $version"
git push --tags