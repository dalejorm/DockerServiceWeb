# DockerServiceWeb UberGallery

[Docker](http://docker.com) 
[UberGallery] (https://www.ubergallery.net/)
[Container] (https://hub.docker.com/_/php?tab=tags)

## Usage
### Pull Container
    
       docker pull php:7.4.6-apache

## Example 1

### Create Image

Pull DockerFile from the Project repository:

    docker build -t gallery:1.0 .

### Run

Run the image for compile container, binding associated ports:

    docker run -d --name UberGallery1 -p 8080:80 gallery:1.0

## Services

Service     | Port | Usage
------------|------|------
UberGallery1| 8080 | When using `UberGallery1 run`, visit `http://localhost:8080` in your browser

## Example 2

### Create volume
Run the sentence for create volume:

       docker volume create volumen-images

### Run

Run the image for compile container, binding associated ports and asociate volume:

    docker run -d --name UberGallery1 -p 8080:80 -v volumen-images:/var/www/html/UberGallery/gallery-images/ gallery:1.0

## Services

Service     | Port | Usage
------------|------|------
UberGallery1| 8080 | When using `UberGallery1 run`, visit `http://localhost:8080` in your browser

## Volumes

Volume          | Description
----------------|-------------
`var/www/html/UberGallery/gallery-images/| The location of the Gallery of UberGallery2 application root.


