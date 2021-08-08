FROM php:7.3-fpm

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
  wget \
  zip \
  zlib1g-dev \
  && apt autoremove \
  && apt clean \
  && pecl install redis \
  && docker-php-ext-configure gd --with-png-dir=/usr/include --with-jpeg-dir=/usr/include \
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
  