FROM node:alpine

RUN apk add --no-cache su-exec
ADD entrypoint.sh /usr/local/bin/entrypoint

ENTRYPOINT [ "entrypoint" ]
