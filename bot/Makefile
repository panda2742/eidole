ENVIRONMENT				:=	dev

override	SRC_FOLDER	:=	src/
override	DIST_FOLDER	:=	.dist/
override	SRC_FILES	:=	main
override	SRC			:=	$(addprefix $(SRC_FOLDER),$(addsuffix .ts,$(SRC_FILES)))
override	DIST		:=	$(addprefix $(DIST_FOLDER),$(addsuffix .js,$(SRC_FILES)))
override	ENTRYPOINT	:=	$(DIST_FOLDER)/main.js

override	TSC			:=	tsc
override	CP			:=	cp
override	NODE		:=	node
override	D_BUILD		:=	docker build
override	D_RUN		:=	docker run
override	D_CTN		:=	docker container
override	D_IMG		:=	docker image
override	IMG_NAME	:=	bot-$(ENVIRONMENT)
override	CTN_NAME	:=	$(IMG_NAME)-container

TSC		:=	tsc

.PHONY:	all
all:	$(ENTRYPOINT)
	@$(MAKE) stop
	$(D_BUILD) . -t $(IMG_NAME) -f envs/$(ENVIRONMENT)/Dockerfile
	$(D_RUN) -d --name $(CTN_NAME) --rm -it $(IMG_NAME)

.PHONY:	local
local:	$(ENTRYPOINT)
	$(CP) ./envs/$(ENVIRONMENT)/.env ./envs/.env
	$(NODE) ./.dist/main.js

.PHONY:	stop
stop:
	$(D_CTN) stop $(CTN_NAME) || echo 0

$(DIST_FOLDER)/main.js:	$(SRC_FOLDER)main.ts
	$(TSC)
