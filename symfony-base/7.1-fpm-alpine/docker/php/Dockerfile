FROM php:7.1-fpm-alpine

ENV APCU_VERSION 5.1.8

RUN apk add --no-cache --virtual .persistent-deps \
		icu-libs \
		libjpeg \
		libpng \
		freetype-dev && \

	apk add --no-cache --virtual .build-deps \
		$PHPIZE_DEPS \
		icu-dev \
		zlib-dev && \

	docker-php-ext-install \
		intl && \

	docker-php-ext-enable \
		opcache && \

	pecl install \
		apcu-${APCU_VERSION} && \
	docker-php-ext-enable --ini-name 20-apcu.ini apcu && \

	apk del .build-deps
