docker rm init
docker build --tag my_img:1.0 .
docker run -it --name init my_img:1.0