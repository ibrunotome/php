FROM php:7.3

ENV SWOOLE_VERSION=4.3.5

WORKDIR /var/www

RUN rm -rf /var/www/html \
&& apt-get update -y \
&& apt-get install -y \
autoconf \
build-essential \
curl \
libmpdec-dev \
libpq-dev \
libjpeg-dev \
libpng-dev \
libzip-dev \
nginx \
supervisor \
unzip \
wget \
zip \
&& apt autoremove \
&& apt clean \
&& pecl install redis \
&& pecl install decimal \
&& pecl install stackdriver_debugger-alpha \
&& pecl install swoole-$SWOOLE_VERSION \
&& docker-php-ext-configure gd --with-png-dir=/usr/include --with-jpeg-dir=/usr/include \
&& docker-php-ext-install \
bcmath \
gd \
opcache \
pcntl \
pdo_pgsql \
pgsql \
sockets \
zip \
&& curl -sS https://getcomposer.org/installer | php \
&& mv composer.phar /usr/local/bin/composer \
&& composer self-update --clean-backups
