FROM php:7.4.6-apache

RUN apt-get update && \
    apt-get install -y wget git zip unzip vim libpng-dev zlib1g-dev

RUN docker-php-ext-install gd

RUN mkdir -p /tmp/descargas
WORKDIR /tmp/descargas

# Dowload ubergallery
RUN wget http://files.ubergallery.net/releases/UberGallery-v2.4.8.tar.gz
RUN tar zxf UberGallery-v2.4.8.tar.gz -C /var/www/html/
RUN mv /var/www/html/UberGallery-v2.4.8 /var/www/html/UberGallery

#Config uberGallery
RUN cp /var/www/html/UberGallery/resources/sample.galleryConfig.ini /var/www/html/UberGallery/resources/galleryConfig.ini

#Change config
RUN chown -R www-data:www-data /var/www/html

EXPOSE 80