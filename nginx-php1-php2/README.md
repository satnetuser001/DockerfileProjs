Host with nginx web server and several php-fpm web applications working in docker containers.

Request from the client, it is suggested to use Postman, is processed by nginx web server and
transmitted according to the FastCGI protocol in PHP-FPM through docker network as shown in
the diagram.

   +-----------------+
   |     client      |
   |     Postman     |
   +--------+--------+
            |             +----------------------+        +----------------------+
            | request --- |  localhost:8090      | --or-- |  localhost:8090      |
            |             |  host->app1.example  |        |  host->app2.example  |
            V             +----------------------+        +----------------------+
      +-----------+
      | nginx     |
      | container |
      +-----+-----+
            |
            | routing to web applications
            | in docker network "nginx-php1-php2"
            V
     --+--------------------+--------------------+------->
       |                    |                    |
       V                    V                    V
+--------------+     +--------------+     +--------------+
| web app php1 |     | web app php2 |     | web app phpN |
| container    |     | container    |     | container    |
+--------------+     +--------------+     +--------------+



To run execute one by one in current directory:

-create docker network
docker network create nginx-php1-php2

-build php appliction 1 image
docker build -t n-p1-p2-php1 ./php1

-build php appliction 2 image
docker build -t n-p1-p2-php2 ./php2

-build nginx image
docker build -t n-p1-p2-nginx ./nginx

-run php appliction 1 container
docker run -d --name n-p1-p2-php1 --network nginx-php1-php2 n-p1-p2-php1

-run php appliction 2 container
docker run -d --name n-p1-p2-php2 --network nginx-php1-php2 n-p1-p2-php2

-run nginx container
docker run -d -p 8090:80 --name n-p1-p2-nginx --network nginx-php1-php2 n-p1-p2-nginx



To attach to a container shell:
docker exec -it container-name bash



To see the result:
-in Postman create GET request to 127.0.0.1:8090 and in Headers
add Key:host with Value:php1.example or with Value:php2.example



To remove all execute one by one:

-stop containers:
docker container stop n-p1-p2-nginx
docker container stop n-p1-p2-php1
docker container stop n-p1-p2-php2

-remove containers:
docker container rm n-p1-p2-php1
docker container rm n-p1-p2-php2
docker container rm n-p1-p2-nginx

-remove images:
docker image rm n-p1-p2-php1
docker image rm n-p1-p2-php2
docker image rm n-p1-p2-nginx

-remove docker network:
docker network rm nginx-php1-php2


Other:
-in the nginx directory has the default nginx setting in the "default.conf" file