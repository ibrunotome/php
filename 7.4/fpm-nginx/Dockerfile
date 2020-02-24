FROM ibrunotome/php:7.4-fpm

WORKDIR /var/www

RUN rm -rf /var/www/html \
  && apt-get update -y \
  && apt-get install -y \
  nginx \
  nginx-extras
