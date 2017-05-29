FROM php:7.1-fpm

ENV APCU_VERSION 5.1.8

RUN apt-get update && \

    apt-get install -y --no-install-recommends \
        sudo \
        libicu-dev && \

    docker-php-ext-install \
        mbstring \
        intl \
        opcache && \

    pecl install apcu-$APCU_VERSION && \
    docker-php-ext-enable apcu && \

    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \

    echo "short_open_tag = off" >> /usr/local/etc/php/php.ini && \
    echo "date.timezone = Europe/Paris" >> /usr/local/etc/php/conf.d/symfony.ini && \
    echo "opcache.max_accelerated_files = 20000" >> /usr/local/etc/php/conf.d/symfony.ini && \
    echo "realpath_cache_size=4096K" >> /usr/local/etc/php/conf.d/symfony.ini && \
    echo "realpath_cache_ttl=600" >> /usr/local/etc/php/conf.d/symfony.ini

ADD ./bin/* /usr/local/bin/

ENV GOSU_VERSION 1.10
RUN install-gosu.sh

ENTRYPOINT ["entrypoint.sh"]
