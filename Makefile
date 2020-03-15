
export METEOR_VERSION=1.9.3
export DOCKERIZE_VERSION=v0.6.1
export IMAGE_VERSION=${METEOR_VERSION}
export IMAGE_NAME=chrisgarrett/meteor-dev

.PHONEY: all prep build bash

all: build

prep:
	envsubst '$${METEOR_VERSION},$${DOCKERIZE_VERSION},$${IMAGE_VERSION},$${IMAGE_NAME}' < ./templates/Dockerfile.template > Dockerfile
	envsubst '$${METEOR_VERSION},$${DOCKERIZE_VERSION},$${IMAGE_VERSION},$${IMAGE_NAME}' < ./templates/README.md.template > README.md

build: prep
	docker build --rm=true -t ${IMAGE_NAME}:${IMAGE_VERSION} .

bash:
	docker run --rm -it --entrypoint bash ${IMAGE_NAME}:${IMAGE_VERSION}

example_setup:
	docker run --rm -v `pwd`/src:/work/app/src ${IMAGE_NAME}:${IMAGE_VERSION} create --release ${IMAGE_VERSION} /work/app/src
	docker run --rm -v `pwd`/src:/work/app/src ${IMAGE_NAME}:${IMAGE_VERSION} npm install
	docker run --rm -v `pwd`/src:/work/app/src ${IMAGE_NAME}:${IMAGE_VERSION} npm rebuild

example_run:
	docker run --rm -p 3000:3000 -v `pwd`/src:/work/app/src ${IMAGE_NAME}:${IMAGE_VERSION}

example_clean:
	rm -fr src/* src/.meteor/ src/.gitignore
