# Disclaimer

This is for my personal use, dependencies can come and go at any time 🤷‍♂️

## Example of usage

The docker-compose.dev.yml is an example of develop environment with individual containers for nginx/app/queue/redis/pgsql

```Dockerfile
FROM composer:2.2.6 AS backend
WORKDIR /app

COPY auth.json composer.json composer.lock ./
RUN composer install --no-dev --no-scripts --ignore-platform-reqs

COPY . .

FROM node:16-alpine as frontend
WORKDIR /app

COPY . .
RUN yarn install && yarn prod

FROM ibrunotome/php:8.2-swoole
WORKDIR /var/www

COPY --from=backend /app /var/www
COPY --from=backend /app/php.ini /usr/local/etc/php/php.ini
COPY --from=frontend /app/public /var/www/public

EXPOSE 8000

CMD ["php", "artisan", "octane:start", "--host=0.0.0.0", "--port=8000"]
```
