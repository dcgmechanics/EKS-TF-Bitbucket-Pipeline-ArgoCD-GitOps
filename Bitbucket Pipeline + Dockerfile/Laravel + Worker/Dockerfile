FROM ubuntu:22.04

RUN apt-get update -y

RUN DEBIAN_FRONTEND=noninteractive TZ=Etc/UTC apt-get -y install tzdata

RUN apt-get install -y git net-tools iputils-ping mysql-client htop

ARG PHP_VERSION=8.2

ENV PHP_VERSION ${PHP_VERSION}

# Install PHP dependencies
RUN apt-get update && \
    apt-get -y upgrade && \
    apt-get install -y software-properties-common && \
    LC_ALL=C.UTF-8 add-apt-repository -y -u ppa:ondrej/php && \
    apt-get install -y \
    php${PHP_VERSION} \
    php${PHP_VERSION}-fpm \
    php${PHP_VERSION}-mysql \
    mcrypt \
    php${PHP_VERSION}-gd \
    php${PHP_VERSION}-xml \
    php${PHP_VERSION}-gmp \
    curl \
    zip \
    php${PHP_VERSION}-zip \
    php${PHP_VERSION}-curl \
    php${PHP_VERSION}-redis \
    php${PHP_VERSION}-mbstring \
    php${PHP_VERSION}-xml \
    php${PHP_VERSION}-opcache \
    php${PHP_VERSION}-bcmath \
    php${PHP_VERSION}-mcrypt \
    php${PHP_VERSION}-intl \
    nginx \
    vim \
    supervisor && \
    rm -fr /var/lib/apt/lists/*

#Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

###################################################################
RUN /usr/sbin/phpenmod mcrypt

RUN usermod -u 1000 www-data && groupmod -g 1000 www-data

RUN rm -f /etc/nginx/nginx.conf
RUN rm -f /etc/nginx/sites-enabled/default
ADD . /var/www/app
ADD ./docker/nginx /etc/nginx

WORKDIR /var/www/app

# Install composer dependencies
RUN composer install
# Create the symbolic link from local storage to public
RUN php artisan storage:link

# Generate passport keys
RUN php artisan passport:keys

RUN chown -R www-data:www-data /var/www/app

RUN mkdir /run/php

COPY docker/php/laravel.conf /etc/php/${PHP_VERSION}/fpm/pool.d/laravel.conf
COPY docker/php/php.ini /etc/php/${PHP_VERSION}/fpm/php.ini

RUN rm /etc/php/${PHP_VERSION}/fpm/pool.d/www.conf

RUN sed -i -e 's/;daemonize = yes/daemonize = no/g' /etc/php/${PHP_VERSION}/fpm/php-fpm.conf

COPY docker/supervisord.conf /etc/supervisor/conf.d/supervisord.conf
RUN sed -i "s/#PHP_VERSION#/${PHP_VERSION}/g" /etc/supervisor/conf.d/supervisord.conf

RUN chown -R www-data:www-data /var/log/supervisor/ &&\
    chown -R www-data:www-data /etc/nginx/

CMD ["/bin/bash", "./docker/entrypoint.sh"]

EXPOSE 8000
