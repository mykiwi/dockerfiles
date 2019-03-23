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

FROM composer as src

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
    composer bin phpstan require --optimize-autoloader \
        phpstan/phpstan \
        phpstan/phpstan-dibi \
        phpstan/phpstan-doctrine \
        phpstan/phpstan-phpunit \
        phpstan/phpstan-shim \
        phpstan/phpstan-strict-rules; \
    composer bin symfony-friendly require --optimize-autoloader \
        allocine/twigcs \
        friendsofphp/php-cs-fixer \
        heahdude/yaml-linter \
        pdepend/pdepend \
        phpmd/phpmd \
        sensiolabs/security-checker \
        squizlabs/php_codesniffer \
        wapmorgan/php-code-fixer

FROM php:7.3-fpm-alpine
COPY --from=vkcom-noverify /root/go/src/github.com/VKCOM/noverify/noverify /usr/local/bin/
COPY --from=vkcom-noverify /usr/src/phpstorm-stubs /usr/src/phpstorm-stubs
COPY --from=src /usr/local/src/ /usr/local/src/
ENV PATH /usr/local/src/vendor/bin:$PATH

RUN mkdir -p /path/to && \
    ln -s /usr/src/phpstorm-stubs /path/to/phpstorm-stubs && \
    apk add --no-cache \
        bash \
        graphviz \
        su-exec && \
    addgroup bar && \
    adduser -D -H -G bar foo

WORKDIR /project
VOLUME  /project

ADD entrypoint.sh /usr/local/bin/
ENTRYPOINT ["entrypoint.sh"]
