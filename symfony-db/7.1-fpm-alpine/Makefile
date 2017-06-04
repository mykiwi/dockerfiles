DC = docker-compose

.DEFAULT_GOAL := help
.PHONY: help

help:
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'

start:          ## Install and start the project
	$(DC) up --build -d

stop:           ## Remove docker containers
	$(DC) kill
	$(DC) rm --force -v
