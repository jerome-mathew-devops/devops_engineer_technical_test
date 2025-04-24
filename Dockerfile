FROM  php:8.4.6-fpm as build

RUN apt-get update && \
    apt-get install -y nginx && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

COPY index.php /var/www/html
COPY default.conf /etc/nginx/default.conf


ENV PORT=8080
EXPOSE 8080
CMD ["bash", "-c", "php-fpm -D && nginx -g 'daemon off;'"]