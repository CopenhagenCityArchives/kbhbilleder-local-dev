FROM nginx:latest

COPY docker/nginx/nginx.conf /etc/nginx/nginx.conf
RUN mkdir -p /var/www/html && chown -R nginx /var/www/html
