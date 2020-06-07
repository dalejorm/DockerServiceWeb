docker build -t gallery:1.0 .

docker run -d --name UberGallery1 -p 8080:80 gallery:1.0

docker volume create volumen-images

docker volume ls

docker volume inspect volumen-images

docker run -d --name UberGallery1 -p 8080:80 -v volumen-images:/var/www/html/UberGallery/gallery-images/ gallery:1.0
