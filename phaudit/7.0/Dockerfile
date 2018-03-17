FROM php:7.0-fpm-alpine as bin

RUN apk add --no-cache \
        wget && \
    wget https://phar.phpunit.de/phploc.phar && \
    chmod +x phploc.phar && \
    mv phploc.phar /usr/local/bin/phploc && \
    wget http://static.pdepend.org/php/latest/pdepend.phar && \
    chmod +x pdepend.phar && \
    mv pdepend.phar /usr/local/bin/pdepend && \
    wget http://static.phpmd.org/php/latest/phpmd.phar && \
    chmod +x phpmd.phar && \
    mv phpmd.phar /usr/local/bin/phpmd && \
    wget https://squizlabs.github.io/PHP_CodeSniffer/phpcs.phar && \
    chmod +x phpcs.phar && \
    mv phpcs.phar /usr/local/bin/phpcs && \
    wget https://squizlabs.github.io/PHP_CodeSniffer/phpcbf.phar && \
    chmod +x phpcbf.phar && \
    mv phpcbf.phar /usr/local/bin/phpcbf && \
    wget https://phar.phpunit.de/phpcpd.phar && \
    chmod +x phpcpd.phar && \
    mv phpcpd.phar /usr/local/bin/phpcpd && \
    wget https://phar.phpunit.de/phpdcd.phar && \
    chmod +x phpdcd.phar && \
    mv phpdcd.phar /usr/local/bin/phpdcd && \
    wget https://github.com/Halleck45/PhpMetrics/raw/master/build/phpmetrics.phar && \
    chmod +x phpmetrics.phar && \
    mv phpmetrics.phar /usr/local/bin/phpmetrics && \
    wget http://get.sensiolabs.org/php-cs-fixer.phar && \
    chmod +x php-cs-fixer.phar && \
    mv php-cs-fixer.phar /usr/local/bin/php-cs-fixer

FROM composer as src

RUN composer global require \
        phpstan/phpstan \
        phpstan/phpstan-dibi \
        phpstan/phpstan-doctrine \
        phpstan/phpstan-phpunit \
        phpstan/phpstan-shim \
        phpstan/phpstan-strict-rules \
        allocine/twigcs

FROM php:7.0-fpm-alpine
COPY --from=bin /usr/local/bin/ /usr/local/bin/
COPY --from=src /tmp /usr/local/src/
ENV PATH /usr/local/src/vendor/bin:$PATH

RUN apk add --no-cache \
        graphviz \
        su-exec && \
    addgroup bar && \
    adduser -D -H -G bar foo

WORKDIR /project
VOLUME  /project

ADD entrypoint.sh /usr/local/bin/
ENTRYPOINT ["entrypoint.sh"]
