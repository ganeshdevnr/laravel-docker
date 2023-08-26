#!/bin/sh
chown -R ${NGINXUSER}:${NGINXGROUP} /var/www/html/storage /var/www/html/storage/logs /var/www/html/bootstrap/cache
chmod -R 775 /var/www/html/storage /var/www/html/storage/logs /var/www/html/bootstrap/cache

# Start Nginx
nginx -g "daemon off;"
