#!/bin/bash

user=$(stat -c %u /srv)
group=$(stat -c %g /srv)

groupadd -g $group group > /dev/null 2>&1 || true
useradd --shell /bin/bash --no-create-home --home-dir /home -u $user -g $group -o -c "" user > /dev/null 2>&1 || true

export APACHE_RUN_USER=user
export APACHE_RUN_GROUP=group

if [ $# -eq 0 ]; then
    apache2-foreground
else
    exec gosu user "$@"
fi
