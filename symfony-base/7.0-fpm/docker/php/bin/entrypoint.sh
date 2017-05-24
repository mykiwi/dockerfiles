#!/bin/bash

user=$(stat -c %u /srv)
group=$(stat -c %g /srv)

groupadd -g $group group
useradd --shell /bin/bash -u $user -g $group -o -c "" -m user
export HOME=/home/user

if [ $# -eq 0 ]; then
    php-fpm
else
    exec gosu user "$@"
fi
