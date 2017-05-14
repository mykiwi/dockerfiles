FROM php:7.1-fpm

ENV APCU_VERSION 5.1.8

RUN apt-get update && \
    apt-get install -y \
        libicu-dev \
        libjpeg-dev \
        libpng12-dev \
        libfreetype6-dev && \

    docker-php-ext-configure \
        gd \
            --enable-gd-native-ttf \
            --with-jpeg-dir=/usr/lib/x86_64-linux-gnu \
            --with-png-dir=/usr/lib/x86_64-linux-gnu \
            --with-freetype-dir=/usr/lib/x86_64-linux-gnu && \

    docker-php-ext-install \
        mbstring \
        intl \
        opcache \
        gd && \

    pecl install apcu-$APCU_VERSION && \
    docker-php-ext-enable apcu && \

    echo "short_open_tag = off" >> /usr/local/etc/php/php.ini && \
    echo "date.timezone = Europe/Paris" >> /usr/local/etc/php/conf.d/symfony.ini && \
    echo "opcache.max_accelerated_files = 20000" >> /usr/local/etc/php/conf.d/symfony.ini && \
    echo "realpath_cache_size=4096K" >> /usr/local/etc/php/conf.d/symfony.ini && \
    echo "realpath_cache_ttl=600" >> /usr/local/etc/php/conf.d/symfony.ini && \

    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
