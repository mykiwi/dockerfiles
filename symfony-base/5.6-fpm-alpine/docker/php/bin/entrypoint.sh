#!/bin/sh

uid=$(stat -c %u /srv)
gid=$(stat -c %g /srv)

addgroup -g $gid group
group=$(grep ":$gid:" /etc/group | cut -d: -f1)

adduser -D -s /bin/sh -u $uid -G $group user
user=$(grep ":x:$uid:" /etc/passwd | cut -d: -f1)
home=$(grep ":x:$uid:" /etc/passwd | cut -d: -f6)
export HOME=$home

sed -i "s/user = www-data/user = $user/g" /usr/local/etc/php-fpm.d/www.conf
sed -i "s/group = www-data/group = $group/g" /usr/local/etc/php-fpm.d/www.conf

if [ $# -eq 0 ]; then
    php-fpm
else
    exec gosu $user "$@"
fi
