#!/bin/sh

echo "<?php while(!file_exists('/srv/tt-rss/config.php')){sleep(60);} require '/srv/tt-rss/update_daemon2.php';" > /tmp/update-feeds.php

su app -c "php /tmp/update-feeds.php" &
su app -c "php -S 0.0.0.0:8000 -t /srv/tt-rss"
