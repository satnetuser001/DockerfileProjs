# source image
#FROM php:8.3.12
# alpine has a smaller size
FROM php:8.3.12-alpine

WORKDIR /app

# expose port
EXPOSE 9000

# run php server, shell form
# not recommended!
#CMD php -S 0.0.0.0:9000

# run php server, exec form
CMD ["php", "-S", "0.0.0.0:9000"]

# debug
#ENTRYPOINT ["/bin/bash"]