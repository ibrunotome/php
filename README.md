## swoole

Example of usage:

```Dockerfile
FROM ibrunotome/php:7.3-swoole

ARG COMPOSER_FLAGS='--prefer-dist --optimize-autoloader'
ARG WITH_XDEBUG=false

COPY . /var/www
COPY php.ini /usr/local/etc/php

RUN composer install $COMPOSER_FLAGS

RUN if [ $WITH_XDEBUG = "true" ] ; then \
        pecl install xdebug; \
        docker-php-ext-enable xdebug; \
        echo "error_reporting = E_ALL" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini; \
        echo "display_startup_errors = On" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini; \
        echo "display_errors = On" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini; \
        echo "xdebug.remote_enable=1" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini; \
    fi ;

CMD ["php", "/var/www/artisan", "swoole:http", "start"]

EXPOSE 8080
```

You have to copy php.ini with your desired settings to `/usr/local/etc/php`

## swoole with nginx as reverse proxy

Example of usage:

```Dockerfile
FROM ibrunotome/php:7.3-swoole-nginx

ARG COMPOSER_FLAGS='--prefer-dist --optimize-autoloader'
ARG WITH_XDEBUG=false

COPY . /var/www
COPY php.ini /usr/local/etc/php
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
COPY nginx.conf /etc/nginx/nginx.conf

RUN composer install $COMPOSER_FLAGS

RUN if [ $WITH_XDEBUG = "true" ] ; then \
        pecl install xdebug; \
        docker-php-ext-enable xdebug; \
        echo "error_reporting = E_ALL" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini; \
        echo "display_startup_errors = On" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini; \
        echo "display_errors = On" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini; \
        echo "xdebug.remote_enable=1" >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini; \
    fi ;

CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/supervisord.conf"]

EXPOSE 8080
```

You have to copy php.ini with your desired settings to `/usr/local/etc/php`

You have to copy nginx.conf to /etc/nginx/nginx.conf

You have to copy supervisord.conf to /etc/supervisor/conf.d/supervisord.conf, it will start swoole, nginx and any other program you have