FROM php:apache
COPY src/ /var/www/html
RUN chown www-data /var/www/html/db -R && \
    docker-php-source extract && \
    docker-php-ext-install pdo_mysql && \
    docker-php-source delete