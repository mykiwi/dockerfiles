#!/bin/bash

user=$(stat -c %u /srv)
group=$(stat -c %g /srv)

groupadd -g $group group > /dev/null 2>&1 || true
useradd --shell /bin/bash --no-create-home --home-dir /home -u $user -g $group -o -c "" user > /dev/null 2>&1 || true

sed -i "s/user = www-data/user = $user/g" /usr/local/etc/php-fpm.d/www.conf
sed -i "s/group = www-data/group = $group/g" /usr/local/etc/php-fpm.d/www.conf

if [ $# -eq 0 ]; then
    php-fpm
else
    exec gosu user "$@"
fi
