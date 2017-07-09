# Install gd

#### debian version

```
apt-get install -y \
    libjpeg-dev \
    libpng12-dev \
    libfreetype6-dev && \

docker-php-ext-configure gd \
    --enable-gd-native-ttf \
    --with-jpeg-dir=/usr/lib/x86_64-linux-gnu \
    --with-png-dir=/usr/lib/x86_64-linux-gnu \
    --with-freetype-dir=/usr/lib/x86_64-linux-gnu && \

docker-php-ext-install gd
```

#### alpine version:

```
RUN apk add --update --no-cache \
        icu-libs \
        libjpeg \
        libpng \
        freetype-dev && \

```

- used by the [Image constraint](http://symfony.com/doc/current/reference/constraints/Image.html#detectcorrupted)
