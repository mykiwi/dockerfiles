FROM mykiwi/symfony-base:7.1-fpm-alpine

# mysql
RUN docker-php-ext-install pdo_mysql

# postgresql
RUN apk add --update --no-cache \
    	postgresql-dev && \

	docker-php-ext-configure \
		pgsql && \

    docker-php-ext-install \
    	pdo_pgsql
