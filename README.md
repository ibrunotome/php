Docker image with php 7.3 and swoole 4.3.5

Example of usage:

```Dockerfile
FROM ibrunotome/swoole:7.3

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

As you can see above, you have to copy your own php.ini, supervisord.conf and nginx.conf files with your desired settings. The supervisord will start both the swoole and the nginx (proxy to swoole).
