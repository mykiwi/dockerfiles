#!/bin/sh
set -e

uid=$(stat -c %u /mnt)
gid=$(stat -c %g /mnt)

if [ $uid == 0 ] && [ $gid == 0 ]; then
    if [ $# -eq 0 ]; then
        exec sh
    else
        exec "$@"
    fi
fi

sed -i -r "s/node:x:\d+:\d+:/node:x:$uid:$gid:/g" /etc/passwd
sed -i -r "s/node:x:\d+:/node:x:$gid:/g" /etc/group
chown $uid:$gid /home/node

if [ $# -eq 0 ]; then
    exec su-exec node sh
else
    exec su-exec node "$@"
fi
