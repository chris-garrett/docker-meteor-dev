#!/bin/sh

VERSION=1.3.4.4
IMAGE_NAME=chrisgarrett/meteor-dev

docker build --build-arg METEOR_VERSION=$VERSION --rm=true -t $IMAGE_NAME:$VERSION .

