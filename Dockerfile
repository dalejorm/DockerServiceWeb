#Construir imagen desde el siguiente contenedor
FROM php:7.4.6-apache
#Ejecución de actualización e instalación de aplicaciones importantes y necesarias
RUN apt-get update && \
    apt-get install -y wget git zip unzip vim libpng-dev zlib1g-dev

#Instalación de libreria php-gd requerida por UberGalerry
RUN docker-php-ext-install gd

#Creación y asignación de repositorio de trabajo
RUN mkdir -p /tmp/descargas
WORKDIR /tmp/descargas

# Descarga, descomprensión de UberGallery y renombramiento de carpeta raiz de UberGallery
RUN wget http://files.ubergallery.net/releases/UberGallery-v2.4.8.tar.gz
RUN tar zxf UberGallery-v2.4.8.tar.gz -C /var/www/html/
RUN mv /var/www/html/UberGallery-v2.4.8 /var/www/html/UberGallery

#Configuración de UberGallery, renombre fichero de configuración
RUN cp /var/www/html/UberGallery/resources/sample.galleryConfig.ini /var/www/html/UberGallery/resources/galleryConfig.ini

#Cambio de owner de repositorio web de apache
RUN chown -R www-data:www-data /var/www/html

#Exposición de puerto 80 para acceder al servicio web.
EXPOSE 80
