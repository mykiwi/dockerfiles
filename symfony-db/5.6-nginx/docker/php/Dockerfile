FROM mykiwi/symfony-base:5.6-fpm

# mysql
RUN docker-php-ext-install pdo_mysql

# postgresql
RUN apt-get update && \
    apt-get install -y \
    	libpq-dev && \

    docker-php-ext-install \
    	pdo_pgsql && \

    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
