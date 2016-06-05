#!/bin/sh

VERSION=1.3.2.4
IMAGE_NAME=chrisgarrett/meteor-dev

docker build --rm=true -t $IMAGE_NAME:$VERSION .
docker tag $IMAGE_NAME:$VERSION $IMAGE_NAME:latest
