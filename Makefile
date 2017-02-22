build:
	cd docker && docker-compose build
	cd devbox && docker-compose build
	cd symfony-base/php56 && docker-compose build
	cd symfony-base/php70 && docker-compose build
	cd symfony-base/php71 && docker-compose build
	cd symfony-db/php56 && docker-compose build
	cd symfony-db/php70 && docker-compose build
	cd symfony-db/php71 && docker-compose build
