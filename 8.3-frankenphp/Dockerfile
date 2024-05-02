FROM dunglas/frankenphp:1.1.4-php8.3.6-alpine

RUN install-php-extensions \
    bcmath \
    intl \
    opcache \
    pcntl \
    pcov \
    pdo_mysql \
    pdo_pgsql \
    redis

EXPOSE 8000