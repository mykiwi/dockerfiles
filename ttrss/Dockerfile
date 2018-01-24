FROM alpine:3.7

ENV TTRSS_VERSION 17.4

ADD https://php.codecasts.rocks/php-alpine.rsa.pub /etc/apk/keys/php-alpine.rsa.pub

RUN echo "@php https://php.codecasts.rocks/v3.7/php-7.2" >> /etc/apk/repositories && \
    apk add --no-cache --update \
        ca-certificates \
        php7@php \
        php7-session@php \
        php7-opcache@php \
        php7-pdo@php \
        php7-pdo_pgsql@php \
        php7-pgsql@php \
        php7-json@php \
        php7-xml@php \
        php7-mbstring@php \
        php7-posix@php \
        php7-iconv@php \
        php7-dom@php \
        php7-curl@php \
        php7-intl@php \
        php7-pcntl@php \
        php7-gd@php && \
    ln -s /usr/bin/php7 /usr/bin/php && \
    echo 'date.timezone = UTC'                   >> /etc/php7/php.ini && \
    echo 'opcache.max_accelerated_files = 20000' >> /etc/php7/php.ini && \
    echo 'realpath_cache_size=4096K'             >> /etc/php7/php.ini && \
    echo 'realpath_cache_ttl=600'                >> /etc/php7/php.ini && \
    wget -O ttrss.tar.gz https://git.tt-rss.org/fox/tt-rss/archive/${TTRSS_VERSION}.tar.gz && \
    tar -xf ttrss.tar.gz -C /srv && \
    rm ttrss.tar.gz && \
    adduser -D -H -s /bin/sh app && \
    chown -R app /srv

EXPOSE 8000

ADD run.sh /bin/run.sh

CMD ["run.sh"]
