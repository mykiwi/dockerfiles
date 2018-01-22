FROM php:5.6-apache

ENTRYPOINT ["entrypoint"]

ENV COMPOSER_ALLOW_SUPERUSER 1
ENV COMPOSER_HOME /home/.composer
ENV APCU_VERSION 4.0.11
ENV GOSU_VERSION 1.10

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        ca-certificates \
        git \
        libicu-dev \
        openssh-client \
        unzip \
        zlib1g-dev && \
    docker-php-ext-install \
        mbstring \
        intl \
        opcache && \
    pecl install \
        apcu-${APCU_VERSION} && \
    docker-php-ext-enable \
        apcu && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    echo "short_open_tag = off" >> /usr/local/etc/php/php.ini && \
    echo "date.timezone = Europe/Paris" >> /usr/local/etc/php/conf.d/symfony.ini && \
    echo "opcache.max_accelerated_files = 20000" >> /usr/local/etc/php/conf.d/symfony.ini && \
    echo "realpath_cache_size=4096K" >> /usr/local/etc/php/conf.d/symfony.ini && \
    echo "realpath_cache_ttl=600" >> /usr/local/etc/php/conf.d/symfony.ini && \
    curl -L -s -o /bin/gosu https://github.com/tianon/gosu/releases/download/${GOSU_VERSION}/gosu-$(dpkg --print-architecture | awk -F- '{ print $NF }') && \
    chmod +x /bin/gosu && \
    php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" && php composer-setup.php --install-dir=/usr/local/bin --filename=composer && rm composer-setup.php && \
    chmod +x /usr/local/bin/composer && \
    a2enmod rewrite && \
    addgroup bar && \
    adduser --home=/home --shell=/bin/bash --ingroup=bar --disabled-password --quiet foo && \
    composer global require hirak/prestissimo && chown -R foo:bar /home/.composer

ADD entrypoint.sh /usr/local/bin/entrypoint

