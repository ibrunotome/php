FROM phpswoole/swoole:5.1.0-php8.2-alpine

RUN set -ex \
    && apk add --no-cache --virtual .build-deps $PHPIZE_DEPS \
    autoconf \
    && pecl update-channels \
    && pecl install pcov \
    && docker-php-ext-enable pcov \
    && apk del .build-deps \
    && apk --no-cache add nodejs postgresql-libs postgresql-dev \
    && docker-php-ext-configure intl \
    && docker-php-ext-install \
    intl \
    pgsql \
    pdo_pgsql \
    pdo_mysql \
    pcntl \
    bcmath \
    opcache \
    && docker-php-ext-enable intl \
    && apk del postgresql-dev \
    && rm -rf /tmp/* /usr/local/lib/php/doc/* /var/cache/apk/*

EXPOSE 8000

CMD ["php", "artisan", "octane:start", "--host=0.0.0.0", "--port=8000"]

