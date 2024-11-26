# source image
FROM php:8.3.12-alpine

#set working directory
WORKDIR /app

#copy index file
COPY index.php .

# expose port
EXPOSE 8000

# run php server, exec form
CMD ["php", "index.php"]