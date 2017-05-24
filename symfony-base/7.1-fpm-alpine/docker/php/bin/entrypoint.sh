#!/bin/sh

uid=$(stat -c %u /srv)
gid=$(stat -c %g /srv)

addgroup -g $gid group
group=$(grep ":$gid:" /etc/group | cut -d: -f1)

adduser -D -s /bin/sh -u $uid -G $group user
user=$(grep ":x:$uid:" /etc/passwd | cut -d: -f1)
home=$(grep ":x:$uid:" /etc/passwd | cut -d: -f6)
export HOME=$home

if [ $# -eq 0 ]; then
    exec gosu $user php-fpm
else
    exec gosu $user "$@"
fi
