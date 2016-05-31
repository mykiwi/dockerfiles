build:
	cd symfony-base/php55 && docker-compose build
	cd symfony-base/php56 && docker-compose build
	cd symfony-base/php70 && docker-compose build
	cd symfony-db/php55 && docker-compose build
	cd symfony-db/php56 && docker-compose build
	cd symfony-db/php70 && docker-compose build
