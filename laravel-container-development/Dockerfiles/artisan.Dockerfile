# source image
FROM php:8.3.12-alpine

WORKDIR /app

# expose port
EXPOSE 9000

# run php server, exec form
CMD ["php", "artisan", "serve", "--host=0.0.0.0", "--port=9000"]