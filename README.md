## Example of usage

- You have to copy php.ini with your desired settings to `/usr/local/etc/php`
- You have to copy www.conf to /usr/local/etc/php-fpm.d/www.conf(if you using an image with fpm)
- You have to copy nginx.conf to /etc/nginx/nginx.conf (if you using an image with nginx)
- You have to copy supervisord.conf to /etc/supervisor/conf.d/supervisord.conf if you're stating multiple programs at same time

## fpm

```Dockerfile
FROM ibrunotome/php:7.4-fpm

ARG COMPOSER_FLAGS

WORKDIR /var/www

COPY . /var/www
COPY php.ini /usr/local/etc/php/php.ini
COPY www.conf /usr/local/etc/php-fpm.d/www.conf
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

RUN composer install $COMPOSER_FLAGS \
    && chown -R www-data:www-data /var/www

CMD ["/usr/local/sbin/php-fpm"]

EXPOSE 9000
```

### fpm with nginx as reverse proxy

```Dockerfile
FROM ibrunotome/php:7.4-fpm

ARG COMPOSER_FLAGS

WORKDIR /var/www

COPY . /var/www
COPY php.ini /usr/local/etc/php/php.ini
COPY www.conf /usr/local/etc/php-fpm.d/www.conf
COPY nginx.conf /etc/nginx/nginx.conf
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

RUN composer install $COMPOSER_FLAGS \
    && chown -R www-data:www-data /var/www

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/supervisord.conf"]

EXPOSE 9000
```

### swoole

```Dockerfile
FROM ibrunotome/php:7.4-swoole

ARG COMPOSER_FLAGS='--prefer-dist --optimize-autoloader'

COPY . /var/www
COPY php.ini /usr/local/etc/php

RUN composer install $COMPOSER_FLAGS

CMD ["php", "/var/www/artisan", "swoole:http", "start"]

EXPOSE 8080
```

You have to copy php.ini with your desired settings to `/usr/local/etc/php`

### swoole with nginx as reverse proxy

```Dockerfile
FROM ibrunotome/php:7.4-swoole-nginx

ARG COMPOSER_FLAGS='--prefer-dist --optimize-autoloader'

COPY . /var/www
COPY php.ini /usr/local/etc/php
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
COPY nginx.conf /etc/nginx/nginx.conf

RUN composer install $COMPOSER_FLAGS

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/supervisord.conf"]

EXPOSE 8080
```

## Enabling Xdebug

To enable xdebug in any of the above images, you can add the bellow snippet to the Dockerfile

```Dockerfile
ARG WITH_XDEBUG=true

RUN if [ $WITH_XDEBUG = "true" ] ; then \
        pecl install xdebug; \
        docker-php-ext-enable xdebug; \
        echo "error_reporting = E_ALL" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini; \
        echo "display_startup_errors = On" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini; \
        echo "display_errors = On" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini; \
        echo "xdebug.remote_enable=1" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini; \
    fi ;
```
