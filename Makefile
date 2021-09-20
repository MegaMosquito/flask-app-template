
DOCKERHUB_ID:=ibmosquito
NAME:="apache2-template"
VERSION:="1.0.0"
PORT:=80

default: build run

build:
	docker build -t $(DOCKERHUB_ID)/$(NAME):$(VERSION) .

dev: stop build
	docker run -it -v `pwd`:/outside \
	  --name ${NAME} \
	  -p 0.0.0.0:$(PORT):80 \
	  $(DOCKERHUB_ID)/$(NAME):$(VERSION) /bin/bash

run: stop
	docker run -d \
	  --name ${NAME} \
	  --restart unless-stopped \
	  -p 0.0.0.0:$(PORT):80 \
	  $(DOCKERHUB_ID)/$(NAME):$(VERSION)

test:
	curl localhost

push:
	docker push $(DOCKERHUB_ID)/$(NAME):$(VERSION) 

stop:
	@docker rm -f ${NAME} >/dev/null 2>&1 || :

clean:
	@docker rmi -f $(DOCKERHUB_ID)/$(NAME):$(VERSION) >/dev/null 2>&1 || :

.PHONY: build dev run push test stop clean
