FROM nginx:stable-alpine

# Environment variables
ENV NGINXUSER=laravel
ENV NGINXGROUP=laravel

# Create a new user and group
RUN addgroup -g 1000 ${NGINXGROUP} && adduser -G ${NGINXGROUP} -g ${NGINXGROUP} -s /bin/sh -D ${NGINXUSER}

# Create necessary directories
RUN mkdir -p /var/www/html/public \
    && mkdir -p /var/www/html/storage/logs \
    && mkdir -p /var/www/html/bootstrap/cache

# Change permissions for storage and logs
RUN chown -R ${NGINXUSER}:${NGINXGROUP} /var/www/html/storage /var/www/html/storage/logs /var/www/html/bootstrap/cache \
    && chmod -R 775 /var/www/html/storage /var/www/html/storage/logs /var/www/html/bootstrap/cache

# Update Nginx user in nginx.conf
RUN sed -i "s/user nginx;/user ${NGINXUSER};/g" /etc/nginx/nginx.conf

# Add your Nginx config file
ADD nginx/default.conf /etc/nginx/conf.d/default.conf

# Add entrypoint script
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
