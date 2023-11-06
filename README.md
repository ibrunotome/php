# Disclaimer

This is for my personal use, dependencies can come and go at any time 🤷‍♂️

```Dockerfile
FROM --platform=linux/amd64 composer:2.5.5 AS build
WORKDIR /app

COPY composer.json .
COPY composer.lock .
RUN composer install --no-dev --no-scripts --ignore-platform-reqs

COPY . .
RUN rm auth.json && composer dump -a

FROM --platform=linux/amd64 ibrunotome/php:8.2-swoole

ARG ENV_DECRYPT_KEY
ENV APP_ENV=production

WORKDIR /var/www

COPY --from=build /app /var/www
COPY --from=build /app/php.ini /usr/local/etc/php/conf.d/user.ini

RUN php artisan view:cache
RUN php artisan storage:link
RUN php artisan optimize

EXPOSE 8000

CMD ["php", "artisan", "octane:start", "--host=0.0.0.0", "--port=8000"]
```
