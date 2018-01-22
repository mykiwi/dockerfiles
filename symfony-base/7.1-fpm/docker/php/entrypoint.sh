#!/bin/bash
set -e

uid=$(stat -c %u /srv)
gid=$(stat -c %g /srv)

if [ $uid == 0 ] && [ $gid == 0 ]; then
    if [ $# -eq 0 ]; then
        apache2-foreground
    else
        exec "$@"
    fi
fi

sed -i -r "s/foo:x:\d+:\d+:/foo:x:$uid:$gid:/g" /etc/passwd
sed -i -r "s/bar:x:\d+:/bar:x:$gid:/g" /etc/group
chown $uid:$gid /home

if [ $# -eq 0 ]; then
    apache2-foreground
else
    exec gosu foo "$@"
fi
