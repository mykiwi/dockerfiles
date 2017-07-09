FROM mykiwi/symfony-base:7.1-apache

# mysql
RUN docker-php-ext-install pdo_mysql

# postgresql
RUN apt-get update && \
    apt-get install -y \
    	libpq-dev && \

    docker-php-ext-install \
    	pdo_pgsql && \

    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
