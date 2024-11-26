# base docker image
FROM ubuntu:24.04

# declare expose port
EXPOSE 8000

# set environment variable time zone for php installing
ENV TZ=Europe/Kyiv

# install php and composer
RUN apt update && apt install -y \
    php \
    php-xml\
    php-sqlite3 \
    composer \
    && apt clean

# create a new user
RUN useradd -m user

# create a working directory and give the user rights to it
WORKDIR /app
RUN chown -R user:user /app

# switch to a new user
USER user

# install Laravel using composer as user
RUN composer create-project laravel/laravel .

# start the artisan server when the container run
ENTRYPOINT ["php", "artisan", "serve"]
CMD ["--host=0.0.0.0", "--port=8000"]