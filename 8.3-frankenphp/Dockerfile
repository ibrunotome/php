FROM dunglas/frankenphp:1.2.1-php8.3.8-alpine

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