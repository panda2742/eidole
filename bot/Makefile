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
override	RM			:=	rm
override	RM_PARAMS	:=	-r

override	D_BUILD		:=	docker build
override	D_RUN		:=	docker run
override	D_CTN		:=	docker container
override	D_IMG		:=	docker image
override	IMG_NAME	:=	bot-$(ENVIRONMENT)
override	CTN_NAME	:=	$(IMG_NAME)-container

TSC		:=	tsc

.PHONY:	all
all: 	stop $(ENTRYPOINT)
	$(D_BUILD) . -t eidole-$(IMG_NAME) -f envs/$(ENVIRONMENT)/Dockerfile
	$(D_RUN) -d --name eidole-$(CTN_NAME) --rm -it eidole-$(IMG_NAME)

.PHONY: stop
stop:
	$(D_CTN) stop eidole-$(CTN_NAME) || echo 0
	$(D_CTN) rm eidole-$(CTN_NAME) || echo 0
	$(D_IMG) rm eidole-$(IMG_NAME) || echo 0

.PHONY: install
install:
	pnpm install
	pnpm prune

.PHONY:	local
local:	install $(ENTRYPOINT)
	$(CP) ./envs/$(ENVIRONMENT)/.env ./envs/.env
	$(NODE) ./.dist/main.js

$(DIST_FOLDER)/main.js:	$(SRC_FOLDER)main.ts
	$(TSC)

.PHONY: clean
clean:
	$(RM) $(RM_PARAMS) ./.dist || echo ""
	$(RM) $(RM_PARAMS) envs/.env || echo ""

.PHONY: purge
purge: clean
	$(RM) $(RM_PARAMS) node_modules || echo ""
	$(RM) $(RM_PARAMS) pnpm-lock.yaml || echo ""
