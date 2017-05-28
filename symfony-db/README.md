# Pick one version then

- choose your database (mariadb, mysql or pgsql)
- edit the file `docker-compose.yml`:
    - remove the database service that is not used
- edit the file `docker/php/Dockerfile` and remove the database part that is not used
