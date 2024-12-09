FROM dunglas/frankenphp:1.3.3-php8.4.1-alpine

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