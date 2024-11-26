This application was created to test the docker hub repository.

To run the application do in bash in current directory:
1. build an image:
docker build -t satnetuser001/getting-started:v1.0.0 .
2. run the container:
docker run -it --rm --name getting-started satnetuser001/getting-started:v1.0.0
