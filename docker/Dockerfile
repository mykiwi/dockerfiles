FROM docker

RUN set -xe \
 && apk add --no-cache \
      make \
      python3 \
 && pip3 install --upgrade pip \
 && apk add --no-cache --virtual .build-deps \
      gcc \
      libffi-dev \
      musl-dev \
      openssl-dev \
      python3-dev \
 && pip3 install docker-compose \
 && apk del --no-network .build-deps \
 && rm -rf ~/.cache
