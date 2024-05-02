# Disclaimer

This is for my personal use, dependencies can come and go at any time 🤷‍♂️

```Dockerfile
FROM --platform=linux/amd64 composer:2.6.6 AS build
WORKDIR /app

COPY auth.json .
COPY composer.json .
COPY composer.lock .
RUN composer install --no-dev --no-scripts --ignore-platform-reqs

COPY . .
RUN rm auth.json && composer dump --classmap-authoritative

FROM --platform=linux/amd64 ibrunotome/php:8.3.4-frankenphp

ENV APP_ENV=production

WORKDIR /app

COPY --from=build /app /app
COPY --from=build /app/php.ini /usr/local/etc/php/conf.d/user.ini

RUN php artisan view:cache
RUN php artisan optimize

EXPOSE 8000

CMD ["php", "artisan", "octane:frankenphp", "--host=0.0.0.0", "--port=8000"]
```
