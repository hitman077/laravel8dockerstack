FROM php:8.0.3-fpm-buster

# ติดตั้ง Extension ของ php
RUN docker-php-ext-install bcmath pdo_mysql

# สั่ง update image และติดตั้งโปรแกรม git zip และ unzip packge
RUN apt-get update
RUN apt-get install -y git zip unzip

# ติดตั้ง NodeJS
RUN curl -sL https://deb.nodesource.com/setup_14.x | bash -
RUN apt-get install -y nodejs

# ติดตั้ง composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# set working directory
WORKDIR /var/www

EXPOSE 9000


