
NAME=badugisoft/dockbeat

all:

build: build-docker-image

build-docker-image:
	@docker build . -t ${NAME}

push: docker-push

docker-push:
	docker push ${NAME}
