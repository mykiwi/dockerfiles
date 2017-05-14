FROM mykiwi/symfony-base:7.0-fpm

RUN docker-php-ext-install zip && \
    php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" && \
    php composer-setup.php --install-dir=/usr/local/bin --filename=composer --quiet && \

    curl http://get.sensiolabs.org/melody.phar -o /usr/local/bin/melody && \
    chmod a+x /usr/local/bin/melody && \

    melody run --trust --no-cache https://gist.github.com/mykiwi/c2c2a416854183aeb6ccf1694e05a8da
