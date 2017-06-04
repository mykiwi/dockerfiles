<?php

try {
    $mysql = new PDO('mysql:host=mysql', 'root', '');
    echo 'MySQL OK'.PHP_EOL;
} catch (PDOException $e) {
    echo 'Connection to MySQL failed: '.$e->getMessage().PHP_EOL;
    exit(1);
}

try {
    $mysql = new PDO('mysql:host=mariadb', 'root', '');
    echo 'MariaDB OK'.PHP_EOL;
} catch (PDOException $e) {
    echo 'Connection to MariaDB failed: '.$e->getMessage().PHP_EOL;
    exit(1);
}

try {
    $dbh = new PDO('pgsql:host=pgsql', 'user', 'pass');
    echo 'PostgreSQL OK'.PHP_EOL;
} catch (PDOException $e) {
    echo 'Connection to PostgreSQL failed: '.$e->getMessage().PHP_EOL;
    exit(1);
}
