1. Use all commands in the current directory!

2. Create a new Laravel project using a docker container based on Composer in a dev-dir:
docker run -it --rm --mount type=bind,source=$(pwd)/dev-dir,destination=/app composer:latest create-project --prefer-dist laravel/laravel .
Note: for some unknown reason, in the trifle network, the composer gives an error, IMHO the reason is in the DNS settings, use mobile internet

3. Build a php image to run artisan serve:
docker build -t artisan-serve -f Dockerfiles/artisan.Dockerfile .

4. Run the artisan serve container:
docker run -it --rm -p 8000:9000 --mount type=bind,source=$(pwd)/dev-dir,destination=/app --name artisan-serve artisan-serve

To see result open in browser:
127.0.0.1:8000
