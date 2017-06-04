DC = docker-compose

.DEFAULT_GOAL := help
.PHONY: help

help:
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'

start:
	$(DC) up --build -d

stop:
	$(DC) kill
	$(DC) rm --force -v
