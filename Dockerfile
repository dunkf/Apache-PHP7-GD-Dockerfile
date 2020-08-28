
FROM php:7.0-apache

RUN apt-get update \
 && apt-get install -y \
    git \
    libfreetype6-dev \
	libjpeg62-turbo-dev \
	libmcrypt-dev \
    zlib1g-dev \
    libpng-dev \
    libicu-dev \
    g++ \
 && docker-php-ext-install -j$(nproc) iconv mcrypt \
 && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
 && docker-php-ext-install -j$(nproc) gd \
 && docker-php-ext-configure intl \
 && docker-php-ext-install intl \
 && docker-php-ext-install zip \
 && docker-php-ext-install mbstring \
 && a2enmod rewrite \
 && sed -i 's!/var/www/html!/var/www/public!g' /etc/apache2/sites-available/000-default.conf \
 && mv /var/www/html /var/www/public \
 && curl -sS https://getcomposer.org/installer \
  | php -- --install-dir=/usr/local/bin --filename=composer

WORKDIR /var/www

// run in container after build
// apt-get install -y libpng-dev libjpeg62-turbo-dev apt-get install libwebp-dev
// docker-php-ext-configure gd --with-jpeg-dir=/usr/include/ --with-vpx-dir=/usr/include/ --with-webp-dir=/usr/include/ && docker-php-ext-install gd