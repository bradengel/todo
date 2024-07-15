FROM php:apache
RUN apt update && \
    apt upgrade -y && \
    apt install wget -y && \
    wget https://github.com/maxpozdeev/mytinytodo/releases/download/v1.8.1/mytinytodo-v1.8.1.tar.gz -P /var/www && \
    tar -xzf /var/www/mytinytodo-v1.8.1.tar.gz -C /var/www/ && \
    cp /var/www/mytinytodo/* /var/www/html -r && \
    chown www-data:www-data /var/www/html -R && \
    docker-php-source extract && \
    docker-php-ext-install pdo_mysql && \
    docker-php-source delete && \
    mv /var/www/html/setup.php /var/www/setup.php