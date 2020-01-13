FROM alpine as vkcom-noverify

RUN set -xe && \
    apk add --no-cache \
        git \
        go \
        musl-dev && \
    go get -u github.com/VKCOM/noverify && \
    cd /root/go/src/github.com/VKCOM/noverify && \
    go build && \
    git clone https://github.com/JetBrains/phpstorm-stubs.git --depth 1 /usr/src/phpstorm-stubs

FROM php:7.0-fpm-alpine as php-ast

RUN set -xe; \
    apk add --no-cache \
        git \
        $PHPIZE_DEPS; \
    git clone https://github.com/nikic/php-ast.git; \
    cd php-ast; \
    phpize; \
    ./configure; \
    make install

FROM php:7.0-fpm-alpine as src
COPY --from=composer /usr/bin/composer /usr/bin/composer

RUN set -xe; \
    mkdir -p /usr/local/src; \
    cd /usr/local/src; \
    composer init --no-interaction ;\
    composer require --optimize-autoloader \
        bamarni/composer-bin-plugin; \
    composer bin phpunit-guy require --optimize-autoloader \
        phploc/phploc \
        sebastian/phpcpd \
        sebastian/phpdcd; \
    composer bin phpmetrics require --optimize-autoloader \
        phpmetrics/phpmetrics; \
    composer bin symfony-friendly require --optimize-autoloader \
        friendsoftwig/twigcs \
        friendsofphp/php-cs-fixer \
        pdepend/pdepend \
        phan/phan \
        phpmd/phpmd \
        sensiolabs/security-checker \
        squizlabs/php_codesniffer \
        wapmorgan/php-code-fixer; \
    composer bin phplint require --optimize-autoloader \
        jakub-onderka/php-parallel-lint

FROM php:7.0-fpm-alpine

COPY --from=vkcom-noverify /root/go/src/github.com/VKCOM/noverify/noverify /usr/local/bin/
COPY --from=vkcom-noverify /usr/src/phpstorm-stubs /usr/src/phpstorm-stubs
COPY --from=php-ast /var/www/html/php-ast/modules/ast.so /usr/local/lib/php/extensions/
COPY --from=src /usr/local/src/ /usr/local/src/
ENV PATH /usr/local/src/vendor/bin:$PATH

RUN set -xe; \
    mv /usr/local/lib/php/extensions/*.so /usr/local/lib/php/extensions/no-debug-non-zts-*; \
    docker-php-ext-enable ast.so; \
    mkdir -p /path/to; \
    ln -s /usr/src/phpstorm-stubs /path/to/phpstorm-stubs; \
    echo 'memory_limit=-1' >> /usr/local/etc/php/conf.d/docker-php-memlimit.ini; \
    apk add --no-cache \
        bash \
        graphviz \
        su-exec; \
    addgroup bar; \
    adduser -D -H -G bar foo

WORKDIR /project
VOLUME  /project

ADD entrypoint.sh /usr/local/bin/
ENTRYPOINT ["entrypoint.sh"]
