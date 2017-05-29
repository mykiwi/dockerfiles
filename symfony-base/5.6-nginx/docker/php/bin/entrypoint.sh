#!/bin/bash

user=$(stat -c %u /srv)
group=$(stat -c %g /srv)

groupadd -g $group group
useradd --shell /bin/bash -u $user -g $group -o -c "" -m user
export HOME=/home/user

sed -i "s/user = www-data/user = $user/g" /usr/local/etc/php-fpm.d/www.conf
sed -i "s/group = www-data/group = $group/g" /usr/local/etc/php-fpm.d/www.conf

if [ $# -eq 0 ]; then
    php-fpm
else
    exec gosu user "$@"
fi
