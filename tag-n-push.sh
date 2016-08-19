#!/bin/sh

. ./config.sh

echo "Version $VERSION "

git add -u
git commit -m "Updating for version $VERSION"



