FROM php:7.1-fpm-alpine

RUN apk add freetype libpng libjpeg-turbo freetype-dev libpng-dev libjpeg-turbo-dev g++ imagemagick-dev libtool make pcre-dev libmcrypt-dev \
    && pecl install imagick \
    && docker-php-ext-enable imagick \
    && docker-php-ext-enable mcrypt \
    && docker-php-ext-install -j$(nproc) iconv \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install -j$(nproc) gd \
    && docker-php-ext-install -j$(nproc) pdo_mysql \