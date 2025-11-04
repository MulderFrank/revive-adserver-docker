FROM php:8.4-apache

RUN apt-get update && apt-get install -y \
  libzip-dev \
  zip \
  unzip \
  wget \
  && docker-php-ext-install zip

RUN wget https://download.revive-adserver.com/revive-adserver-6.0.1.tar.gz
RUN tar -xvzf revive-adserver-6.0.1.tar.gz -C /var/www/html --strip-components=1

RUN docker-php-ext-install mysqli pdo pdo_mysql

RUN apt-get clean && rm -rf /var/lib/apt/lists/*
