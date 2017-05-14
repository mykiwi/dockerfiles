<?php

error_reporting(E_ALL);
ini_set('display_errors', '1');

for(;;){if(@fsockopen('mysql', 3306)){break;}} # wait for MySQL
try {
    $mysql = new PDO('mysql:host=mysql', 'root', '');
    echo 'MySQL OK'.PHP_EOL;
} catch (PDOException $e) {
    echo 'Connection to MySQL failed: '.$e->getMessage();
    exit(1);
}

for(;;){if(@fsockopen('mariadb', 3306)){break;}} # wait for MariaDB
try {
    $mysql = new PDO('mysql:host=mariadb', 'root', '');
    echo 'MariaDB OK'.PHP_EOL;
} catch (PDOException $e) {
    echo 'Connection to MariaDB failed: '.$e->getMessage();
    exit(1);
}

for(;;){if(@fsockopen('pgsql', 5432)){break;}} # wait for PostgreSQL
try {
    $dbh = new PDO('pgsql:host=pgsql', 'user', 'pass');
    echo 'PostgreSQL OK'.PHP_EOL;
} catch (PDOException $e) {
    echo 'Connection to PostgreSQL failed: '.$e->getMessage();
    exit(1);
}
