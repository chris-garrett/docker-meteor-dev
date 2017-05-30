
VERSION=1.4.4.3
IMAGE_NAME=chrisgarrett/meteor-dev

build:
	VERSION=${VERSION} envsubst < ./templates/Dockerfile.template > Dockerfile
	VERSION=${VERSION} envsubst < ./templates/README.md.template > README.md

	docker build --rm=true -t ${IMAGE_NAME}:${VERSION} .

bash:
	docker run --rm -it --entrypoint bash ${IMAGE_NAME}:${VERSION}

example_setup:
	docker run --rm -v `pwd`/src:/work/app/src ${IMAGE_NAME}:${VERSION} create --release ${VERSION} /work/app/src
	docker run --rm -v `pwd`/src:/work/app/src ${IMAGE_NAME}:${VERSION} npm install
	docker run --rm -v `pwd`/src:/work/app/src ${IMAGE_NAME}:${VERSION} npm rebuild

example_run:
	docker run --rm -p 3000:3000 -v `pwd`/src:/work/app/src ${IMAGE_NAME}:${VERSION}

example_clean:
	rm -fr src/* src/.meteor/ src/.gitignore
