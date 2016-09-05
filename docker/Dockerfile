FROM docker

RUN apk add --update py-pip && \
    apk add --update build-base && \
    pip install docker-compose && \
    rm -rf /var/cache/apk/*
