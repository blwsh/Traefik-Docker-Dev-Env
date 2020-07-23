FROM php:7.4-fpm-alpine

# Install dev dependencies
RUN apk add --no-cache --virtual .build-deps \
    $PHPIZE_DEPS \
    curl-dev \
    imagemagick-dev \
    libtool \
    libxml2-dev

# Install production dependencies
RUN apk add --no-cache \
    bash \
    curl \
    jq \
    g++ \
    gcc \
    git \
    imagemagick \
    libc-dev \
    libpng-dev \
    make \
    mysql-client \
    openssh-client \
    zlib-dev \
    libzip-dev

# Install PECL and PEAR extensions
RUN pecl install imagick \
    && docker-php-ext-enable imagick

# Intall redis extension
RUN pecl install -o -f redis \
    &&  rm -rf /tmp/pear \
    &&  docker-php-ext-enable redis

RUN docker-php-ext-install \
    curl \
    exif \
    iconv \
    pdo \
    pdo_mysql \
    pcntl \
    tokenizer \
    xml \
    gd \
    zip \
    bcmath

COPY etc/php/php.ini /usr/local/etc/php/conf.d/00_laravel.ini

# Composer
COPY --from=composer /usr/bin/composer /usr/bin/composer

# Cleanup dev dependencies
RUN apk del -f .build-deps

# Setup working directory
WORKDIR /src

# Install hirak/prestissimo
RUN composer global require hirak/prestissimo

COPY ./src /src

RUN chown -R www-data:www-data /src && chmod -R 755 /src/storage

RUN composer install --optimize-autoloader --no-dev && php artisan config:cache && php artisan route:cache && php artisan view:cache
