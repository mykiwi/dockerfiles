#!/bin/bash

user=$(stat -c %u /srv)
group=$(stat -c %g /srv)

groupadd -g $group group
useradd --shell /bin/bash -u $user -g $group -o -c "" -m user
export HOME=/home/user

export APACHE_RUN_USER=user
export APACHE_RUN_GROUP=group

if [ $# -eq 0 ]; then
    apache2-foreground
else
    exec gosu user "$@"
fi
