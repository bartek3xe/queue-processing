FROM php:8.3-fpm-alpine

RUN apk update && apk add --no-cache \
    git \
    unzip \
    curl \
    postgresql-dev \
    autoconf \
    build-base && \
    docker-php-ext-install pdo pdo_pgsql && \
    pecl install redis && \
    docker-php-ext-enable redis

COPY docker/composer.phar /usr/local/bin/composer
RUN chmod +x /usr/local/bin/composer

WORKDIR /var/www/html
COPY . .

RUN chown -R www-data:www-data /var/www/html && \
    chmod -R 775 /var/www/html

EXPOSE 9000
