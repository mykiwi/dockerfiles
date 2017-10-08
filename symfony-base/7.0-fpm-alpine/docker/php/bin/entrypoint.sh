#!/bin/sh

uid=$(stat -c %u /srv)
gid=$(stat -c %g /srv)

addgroup -g $gid group > /dev/null 2>&1 || true
group=$(grep ":$gid:" /etc/group | cut -d: -f1)

adduser -D -s /bin/sh -H -h /home -u $uid -G $group user > /dev/null 2>&1 || true
user=$(grep ":x:$uid:" /etc/passwd | cut -d: -f1)
chown -R $user /home

sed -i "s/user = www-data/user = $user/g" /usr/local/etc/php-fpm.d/www.conf
sed -i "s/group = www-data/group = $group/g" /usr/local/etc/php-fpm.d/www.conf

if [ $# -eq 0 ]; then
    php-fpm
else
    exec gosu $user "$@"
fi
