FROM dunglas/frankenphp:1.13.3-php8.5.12-alpine

WORKDIR /app

RUN install-php-extensions \
    bcmath \
    dom \
    excimer \
    intl \
    mbstring \
    opcache \
    pcntl \
    pcov \
    pdo_mysql \
    pdo_pgsql \
    pdo_sqlite \
    redis \
    zip \
    && apk add --no-cache \
        imagemagick-heic \
        imagemagick-webp \
        libheif-libde265

COPY php.ini $PHP_INI_DIR/conf.d/99-app.ini

EXPOSE 8000
