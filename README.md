## Example of usage

The docker-compose.develop.yml is an example of develop environment with individual containers for nginx/fpm/queue/schedule/redis/mysql

### fpm + nginx

- You have to copy php.ini with your desired settings to `/usr/local/etc/php`
- You have to copy www.conf to /usr/local/etc/php-fpm.d/www.conf(if you using an image with fpm)

```Dockerfile
FROM ibrunotome/php:7.4-fpm

ARG COMPOSER_FLAGS

WORKDIR /var/www

COPY . /var/www

RUN composer install $COMPOSER_FLAGS \
    && mv php.ini /usr/local/etc/php/php.ini \
    && mv www.conf /usr/local/etc/php-fpm.d/www.conf \
    && chown -R 0:www-data /var/www \
    && find /var/www -type f -exec chmod 664 {} \; \
    && find /var/www -type d -exec chmod 775 {} \; \
    && chgrp -R www-data public/cache-html storage bootstrap/cache \
    && chmod -R ug+rwx public/cache-html storage bootstrap/cache

CMD ["/usr/local/sbin/php-fpm"]

EXPOSE 9000
```

### swoole

- You have to copy php.ini with your desired settings to `/usr/local/etc/php`

```Dockerfile
FROM ibrunotome/php:7.4-swoole

ARG COMPOSER_FLAGS

WORKDIR /var/www

COPY . /var/www
COPY php.ini /usr/local/etc/php

RUN composer install $COMPOSER_FLAGS

CMD ["php", "/var/www/artisan", "swoole:http", "start"]

EXPOSE 8080
```

You have to copy php.ini with your desired settings to `/usr/local/etc/php`


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
