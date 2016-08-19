#!/bin/sh

. ./config.sh

METEOR_VERSION=$VERSION envsubst < ./templates/Dockerfile.template > Dockerfile
METEOR_VERSION=$VERSION envsubst < ./templates/README.template > README.md

docker build --rm=true -t $IMAGE_NAME:$VERSION .

