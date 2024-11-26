This is single page php application working in Docker container.
Application use docker bind mount, so you can make change in index.php file and see result in browser immediately.

To run the application do in bash in current directory:
1. build an image:
docker build -t php-single-page .
2. run the container:
docker run -it --rm -p 8000:9000 --mount type=bind,source=$(pwd),destination=/app --name php-single-page php-single-page

To see result open in browser:
127.0.0.1:8000
