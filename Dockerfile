# Use official PHP Apache image
FROM php:8.2-apache

RUN docker-php-ext-install mysqli
USER www-data
RUN chown -R www-data:www-data /var/www/html    

# Copy your PHP files into the web root
COPY src/ /var/www/html/

# Expose port 80
EXPOSE 80
