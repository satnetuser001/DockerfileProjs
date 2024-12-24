FROM nginx:latest

# Remove the default configuration
RUN rm /etc/nginx/conf.d/default.conf

# Copying web application configuration files
COPY ./conf.d/ /etc/nginx/conf.d/

EXPOSE 80
