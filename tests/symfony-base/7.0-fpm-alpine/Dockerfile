FROM mykiwi/symfony-base:7.0-fpm-alpine

RUN install-composer.sh && \

    curl http://get.sensiolabs.org/melody.phar -o /usr/local/bin/melody && \
    chmod a+x /usr/local/bin/melody && \

    melody run --trust --no-cache https://gist.github.com/mykiwi/c2c2a416854183aeb6ccf1694e05a8da
