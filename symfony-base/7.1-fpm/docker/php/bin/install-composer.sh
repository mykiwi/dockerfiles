#!/bin/sh

set -ex

apt-get update
apt-get install -y --no-install-recommends \
    git \
    unzip \
    zlib1g-dev \
    ca-certificates
apt-get autoremove

docker-php-ext-install zip

php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php composer-setup.php --install-dir=/usr/local/bin --filename=composer --quiet
rm composer-setup.php
