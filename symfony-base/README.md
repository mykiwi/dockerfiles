# Supported tags and respective `Dockerfile` links

-	[`7.1-fpm-alpine`, `latest` (*7.1-fpm-alpine/docker/php/Dockerfile*)](https://github.com/mykiwi/dockerfiles/tree/master/symfony-base/7.1-fpm-alpine/docker/php/Dockerfile)
-	[`7.1-fpm` (*7.1-fpm/docker/php/Dockerfile*)](https://github.com/mykiwi/dockerfiles/tree/master/symfony-base/7.1-fpm/docker/php/Dockerfile)
-	[`7.1-apache` (*7.1-apache/docker/php/Dockerfile*)](https://github.com/mykiwi/dockerfiles/tree/master/symfony-base/7.1-apache/docker/php/Dockerfile)
-	[`7.0-fpm-alpine` (*7.0-fpm-alpine/docker/php/Dockerfile*)](https://github.com/mykiwi/dockerfiles/tree/master/symfony-base/7.0-fpm-alpine/docker/php/Dockerfile)
-	[`7.0-fpm` (*7.0-fpm/docker/php/Dockerfile*)](https://github.com/mykiwi/dockerfiles/tree/master/symfony-base/7.0-fpm/docker/php/Dockerfile)
-	[`7.0-apache` (*7.0-apache/docker/php/Dockerfile*)](https://github.com/mykiwi/dockerfiles/tree/master/symfony-base/7.0-apache/docker/php/Dockerfile)
-	[`5.6-fpm-alpine` (*5.6-fpm-alpine/docker/php/Dockerfile*)](https://github.com/mykiwi/dockerfiles/tree/master/symfony-base/5.6-fpm-alpine/docker/php/Dockerfile)
-	[`5.6-fpm` (*5.6-fpm/docker/php/Dockerfile*)](https://github.com/mykiwi/dockerfiles/tree/master/symfony-base/5.6-fpm/docker/php/Dockerfile)
-	[`5.6-apache` (*5.6-apache/docker/php/Dockerfile*)](https://github.com/mykiwi/dockerfiles/tree/master/symfony-base/5.6-apache/docker/php/Dockerfile)

# How to use this image.

## From CLI

```
docker run -d \
	--volume /your/code:/srv \
	--workdir /srv \
	mykiwi/symfony-base ...
```

## From docker-compose

```
php:
    image: mykiwi/symfony-base
    working_dir: /srv
    volumes:
        - .:/srv
```

For more details, see [sources](https://github.com/mykiwi/dockerfiles/tree/master/symfony-base/).

---

# Symfony's optional dependences:

- [gd](https://github.com/mykiwi/dockerfiles/tree/master/symfony-base/optional-deps.md#install-gd)

---

[![Build](https://travis-ci.org/mykiwi/dockerfiles.svg?branch=master)](https://travis-ci.org/mykiwi/dockerfiles)  
[![Analytics](https://ga-beacon.appspot.com/UA-91799310-1/github/mykiwi/dockerfiles)](https://github.com/igrigorik/ga-beacon)
