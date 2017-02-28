
VERSION=1.4.3.1
IMAGE_NAME=chrisgarrett/meteor-dev

build:
	VERSION=${VERSION} envsubst < ./templates/Dockerfile.template > Dockerfile
	VERSION=${VERSION} envsubst < ./templates/README.md.template > README.md

	docker build --rm=true -t ${IMAGE_NAME}:${VERSION} .

run:
	docker run --rm -it ${IMAGE_NAME}:${VERSION} bash

up:
	docker run --rm -v `pwd`/src:/work/app/src ${IMAGE_NAME}:${VERSION} create --bare /work/app/src --release ${VERSION}
	docker run --rm -v `pwd`/src:/work/app/src ${IMAGE_NAME}:${VERSION} npm install
	docker run --rm -v `pwd`/src:/work/app/src ${IMAGE_NAME}:${VERSION} npm rebuild

