FROM php:8.0.9-alpine

RUN apk --update add \
  wget \
  curl \
  build-base \
  libmcrypt-dev \
  libxml2-dev \
  pcre-dev \
  zlib-dev \
  autoconf \
  oniguruma-dev \
  openssl \
  openssl-dev \
  freetype-dev \
  libjpeg-turbo-dev \
  jpeg-dev \
  libpng-dev \
  imagemagick-dev \
  imagemagick \
  postgresql-dev \
  libzip-dev \
  gettext-dev \
  nodejs \
  yarn \
  libxslt-dev \
  libgcrypt-dev && \
  rm /var/cache/apk/* && \

  curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer && \
  pecl channel-update pecl.php.net && \
  pecl install mcrypt redis && \
  pecl install swoole && \
  rm -rf /tmp/pear && \

  docker-php-ext-configure gd --with-freetype=/usr/lib/ --with-jpeg=/usr/lib/ && \
  docker-php-ext-install gd \
  mbstring \
  pdo \
  tokenizer \
  xml \
  pcntl \
  bcmath \
  pdo_pgsql \
  zip \
  intl \
  gettext \
  sockets \
  xsl && \

  docker-php-ext-enable redis && \
  docker-php-ext-enable swoole

ENTRYPOINT []

CMD ["php" "-a"]