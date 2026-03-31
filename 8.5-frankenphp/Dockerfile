FROM dunglas/frankenphp:1.12.1-php8.5.4-alpine

RUN install-php-extensions \
    bcmath \
    excimer \
    intl \
    opcache \
    pcntl \
    pcov \
    pdo_mysql \
    pdo_pgsql \
    redis \
    zip

EXPOSE 8000
