
VERSION=1.4.2
IMAGE_NAME=chrisgarrett/meteor-dev

build:
	VERSION=${VERSION} envsubst < ./templates/Dockerfile.template > Dockerfile
	VERSION=${VERSION} envsubst < ./templates/README.md.template > README.md

	docker build --rm=true -t ${IMAGE_NAME}:${VERSION} .

run:
	docker run --rm -it ${IMAGE_NAME}:${VERSION}
