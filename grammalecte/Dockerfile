FROM python:3-alpine AS src

ENV VERSION 0.6.4

RUN apk add --update --no-cache \
      unzip \
      wget \
 && wget http://www.dicollecte.org/grammalecte/zip/Grammalecte-fr-v${VERSION}.zip \
 && unzip Grammalecte-fr-v${VERSION}.zip -d /srv

FROM python:3-alpine

COPY --from=src /srv/ /srv

ENTRYPOINT ["python", "/srv/grammalecte-cli.py"]
