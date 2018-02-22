#!/bin/bash

if [ $# -eq 0 ]; then
    /usr/bin/ssh-keygen -A
    /usr/sbin/sshd -D
else
    exec "$@"
fi
