ENVIRONMENT :=  dev

override	CP			:=	cp
override	RM			:=	rm
override	RM_PARAMS	:=	-r

override	D_BUILD		:=	docker build
override	D_RUN		:=	docker run
override	D_CTN		:=	docker container
override	D_IMG		:=	docker image
override	D_CMP		:=	docker compose
override	IMG_NAME	:=	eidole-bot-$(ENVIRONMENT)
override	CTN_NAME	:=	bot-$(ENVIRONMENT)-container

.PHONY: all
all:
	$(D_CMP) -f docker-compose.$(ENVIRONMENT).yaml up -d

.PHONY: stop
stop:
	$(D_CTN) stop $(CTN_NAME) || echo 0
	$(D_CTN) rm $(CTN_NAME) || echo 0
	$(D_IMG) rm $(IMG_NAME) || echo 0
