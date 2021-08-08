FROM php:7.4-fpm

WORKDIR /var/www

RUN rm -rf /var/www/html \
  && apt-get update -y \
  && apt-get install -y \
  autoconf \
  build-essential \
  curl \
  git \
  libicu-dev \
  libmpdec-dev \
  libpq-dev \
  libjpeg-dev \
  libpng-dev \
  libzip-dev \
  unzip \
  vim \
  zip \
  zlib1g-dev \
  && apt clean \
  && pecl install redis \
  && docker-php-ext-configure gd --enable-gd --with-jpeg \
  && docker-php-ext-install \
  bcmath \
  exif \
  gd \
  intl \
  opcache \
  pcntl \
  pdo_mysql \
  pdo_pgsql \
  pgsql \
  zip \
  && curl -sS https://getcomposer.org/installer | php \
  && mv composer.phar /usr/local/bin/composer