# APACHE PHP7 with GD installed Dockerfile 
A Dockerfile / Docker config for php:7.0-apache, GD (JPEG, PNG).


# Usage

1. Create folder named 'php-apache' and place docker file inside

2. Run `docker-compose build`

3. Run `docker-compose up -d`

4. Inside Container  

5. Run `apt-get install -y libpng-dev libjpeg62-turbo-dev apt-get install libwebp-dev`

6. Run `docker-php-ext-configure gd --with-jpeg-dir=/usr/include/ --with-vpx-dir=/usr/include/ --with-webp-dir=/usr/include/ && docker-php-ext-install gd`

# Sample Docker-compose 

    version: "2"
    
    services:
     php-apache:
       build:
           context: ./php-apache   //location of Docker file
       ports:
           80:80
       volumes:
           - ./www:/var/www/html  //location of web root
       //  - .apache:/etc/apache2  //config files(requires files copied from container)
       //  - .php:/usr/local/etc/php //config files(requires files copied from container)
