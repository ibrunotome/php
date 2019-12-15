FROM php:7.3-fpm

WORKDIR /var/www

RUN rm -rf /var/www/html \
  && apt-get update -y \
  && apt-get install -y \
  autoconf \
  build-essential \
  curl \
  git \
  libmpdec-dev \
  libpq-dev \
  libjpeg-dev \
  libpng-dev \
  libzip-dev \
  supervisor \
  unzip \
  vim \
  wget \
  zip \
  && apt autoremove \
  && apt clean \
  && pecl install redis \
  && pecl install decimal \
  && pecl install stackdriver_debugger-alpha \
  && pecl install grpc \
  && pecl install protobuf \
  && docker-php-ext-configure gd --with-png-dir=/usr/include --with-jpeg-dir=/usr/include \
  && docker-php-ext-install \
  bcmath \
  exif \
  gd \
  opcache \
  pcntl \
  pdo_mysql \
  pdo_pgsql \
  pgsql \
  sockets \
  zip \
  && curl -sS https://getcomposer.org/installer | php \
  && mv composer.phar /usr/local/bin/composer \
  && composer self-update --clean-backups
