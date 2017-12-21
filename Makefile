
IMAGE_VERSION=1.6.0.1
IMAGE_NAME=chrisgarrett/meteor-dev

build:
	VERSION=${IMAGE_VERSION} envsubst '$${VERSION}' < ./templates/Dockerfile.template > Dockerfile
	VERSION=${IMAGE_VERSION} envsubst '$${VERSION}' < ./templates/README.md.template > README.md

	docker build --rm=true -t ${IMAGE_NAME}:${IMAGE_VERSION} .

bash:
	docker run --rm -it --entrypoint bash ${IMAGE_NAME}:${IMAGE_VERSION}

example_setup:
	docker run --rm -v `pwd`/src:/work/app/src ${IMAGE_NAME}:${IMAGE_VERSION} meteor create --release ${IMAGE_VERSION} /work/app/src
	docker run --rm -v `pwd`/src:/work/app/src ${IMAGE_NAME}:${IMAGE_VERSION} meteor npm install
	docker run --rm -v `pwd`/src:/work/app/src ${IMAGE_NAME}:${IMAGE_VERSION} meteor npm rebuild

example_run:
	docker run --rm -p 3000:3000 -v `pwd`/src:/work/app/src ${IMAGE_NAME}:${IMAGE_VERSION}

example_clean:
	rm -fr src/* src/.meteor/ src/.gitignore

test_jenkins:
	docker run --rm -it \
		--add-host jenkins.nesteggs.ca:10.0.0.50 \
		-e JENKINS_URL=https://jenkins.nesteggs.ca/computer/meteor-ubuntu/slave-agent.jnlp \
		-e JENKINS_SECRET=3a0004de392a96e0172a592b8b227c3046ae9ae049648227ffe9f5b74907cb12 \
		-v `pwd`/src:/work/app/src \
		${IMAGE_NAME}:${IMAGE_VERSION} \
		jenkins-agent
