#!/bin/sh
set -e

usage()
{
  echo "Usage:
  phploc ...
  pdepend ...
  phpmd ...
  phpcs ...
  phpcbf ...
  phpcpd ...
  phpdcd ...
  phpmetrics  ...
  php-cs-fixer ...
  phpstan ...
  twigcs ..."

  exit
}

uid=$(stat -c %u /project)
gid=$(stat -c %g /project)

if [ $uid == 0 ] && [ $gid == 0 ]; then
  if [ $# -eq 0 ]; then
    usage
  else
    exec "$@"
  fi
fi

sed -i -r "s/foo:x:\d+:\d+:/foo:x:$uid:$gid:/g" /etc/passwd
sed -i -r "s/bar:x:\d+:/bar:x:$gid:/g" /etc/group

if [ $# -eq 0 ]; then
  usage
else
  user=$(grep ":x:$uid:" /etc/passwd | cut -d: -f1)
  exec su-exec $user "$@"
fi
