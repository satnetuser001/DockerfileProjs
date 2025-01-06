Create separate containers with mysql and phpmyadmin and their own network.
Run commands in the current directory:

-create network:
docker network create mysql-phpmyadmin

-create mysql container:
docker run -d -v ./mysql-data:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=1077 --network=mysql-phpmyadmin --name mysql mysql

-create phpmyadmin container, note "-e PMA_HOST=mysql" points to a container with mysql:
docker run -d -e PMA_HOST=mysql --network=mysql-phpmyadmin --name phpmyadmin -p 1500:80 phpmyadmin

-to see result open in browser:
localhost:1500

Username: root
Password: 1077