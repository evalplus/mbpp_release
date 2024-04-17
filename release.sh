#!/bin/bash

version=$1

if [ -z "$version" ]; then
  echo "Usage: release.sh <version>"
  exit 1
fi

git tag -a $version -m "MBPP+ $version"
git push --tags
gh release create $version $(dirname $0)/*.jsonl.gz --title "MBPP+ $version" --notes "MBPP+ $version"
python hf_upload.py --version "$version" --overwrite
