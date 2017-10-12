
NAME=badugisoft/dockbeat

all:

build: build-docker-image

build-docker-image:
	@docker build . -t ${NAME}

docker-push:
	docker push ${NAME}

compile:
	@docker run --rm \
	    -v ${PWD}:/work \
	    golang:1.7-alpine \
	    /work/compile_dockbeat.sh
