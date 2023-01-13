FROM openswoole/swoole:4.12.1-php8.2-alpine

RUN set -ex \
    && apk add --no-cache --virtual .build-deps $PHPIZE_DEPS \
    autoconf \
    && pecl update-channels \
    && pecl install redis-stable \
    && docker-php-ext-enable redis \
    && pecl install pcov \
    && docker-php-ext-enable pcov \
    && apk del .build-deps \
    && apk --no-cache add nodejs supervisor postgresql-libs postgresql-dev \
    && docker-php-ext-install \
    pgsql \
    pdo_pgsql \
    pdo_mysql \
    pcntl \
    bcmath \
    opcache \
    && apk del postgresql-dev

EXPOSE 8000

CMD ["php", "artisan", "octane:start", "--host=0.0.0.0", "--port=8000"]

