FROM php:5.6-fpm-alpine

ENTRYPOINT ["entrypoint"]

ENV COMPOSER_ALLOW_SUPERUSER 1
ENV COMPOSER_HOME /home/.composer
ENV APCU_VERSION 4.0.11
ENV GOSU_VERSION 1.10

RUN apk add --no-cache \
        ca-certificates \
        git \
        icu-libs \
        openssh-client \
        unzip && \
    apk add --no-cache --virtual .build-deps \
        $PHPIZE_DEPS \
        zlib-dev \
        icu-dev && \
    docker-php-ext-install \
        mbstring \
        intl \
        opcache \
        zip && \
    pecl install \
        apcu-${APCU_VERSION} && \
    docker-php-ext-enable \
        apcu \
        opcache && \
    apk del .build-deps && \
    echo "short_open_tag = off" >> /usr/local/etc/php/php.ini && \
    echo "date.timezone = Europe/Paris" >> /usr/local/etc/php/conf.d/symfony.ini && \
    echo "opcache.max_accelerated_files = 20000" >> /usr/local/etc/php/conf.d/symfony.ini && \
    echo "realpath_cache_size=4096K" >> /usr/local/etc/php/conf.d/symfony.ini && \
    echo "realpath_cache_ttl=600" >> /usr/local/etc/php/conf.d/symfony.ini && \
    apk add --no-cache su-exec && \
    ln -s /sbin/su-exec /sbin/gosu && \
    php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" && php composer-setup.php --install-dir=/usr/local/bin --filename=composer && rm composer-setup.php && \
    chmod +x /usr/local/bin/composer && \
    addgroup bar && \
    adduser -D -h /home -s /bin/sh -G bar foo && \
    composer global require hirak/prestissimo && chown -R foo:bar /home/.composer

ADD entrypoint.sh /usr/local/bin/entrypoint
