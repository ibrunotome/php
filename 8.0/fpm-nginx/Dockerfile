FROM ibrunotome/php:8.0-fpm

WORKDIR /var/www

RUN rm -rf /var/www/html \
  && apt-get update -y \
  && apt-get install -y \
  nginx \
  nginx-extras
