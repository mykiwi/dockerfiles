FROM mykiwi/symfony-base:5.6-fpm-alpine

# mysql
RUN docker-php-ext-install pdo_mysql

# postgresql
RUN apk add --update --no-cache \
    	postgresql-dev && \

	docker-php-ext-configure \
		pgsql && \

    docker-php-ext-install \
    	pdo_pgsql
