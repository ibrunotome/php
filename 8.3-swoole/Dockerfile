FROM phpswoole/swoole:php8.3-alpine

COPY --from=mlocati/php-extension-installer /usr/bin/install-php-extensions /usr/local/bin/

RUN install-php-extensions bcmath \
    intl \
    opcache \
    pcntl \
    pcov \
    pdo_mysql \
    pdo_pgsql \
    redis

EXPOSE 8000
