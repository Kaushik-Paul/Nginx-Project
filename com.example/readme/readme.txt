// To spin up docker with custom nginx welcome page

docker run --name nginx -p 80:80 --hostname ng1 -v D:/Projects/nginx_project/html:/usr/share/nginx/html -d nginx:1.28.0-alpine

docker run  --hostname javaapp1 --name javaapp1 -d javaapp

docker build . -t javaapp


PS D:\Projects\nginx_project> docker network connect backendnet javaapp1
PS D:\Projects\nginx_project> docker network connect backendnet javaapp2
PS D:\Projects\nginx_project> docker network connect backendnet javaapp3
PS D:\Projects\nginx_project> docker network connect backendnet nginx


docker run --name nginx -p 80:8080 --hostname ng1 -v D:/Projects/nginx_project/nginx.conf:/etc/nginx/nginx.conf -d nginx:1.28.0-alpine

docker run --name ng2 -p 81:8080 --hostname ng2 -v D:/Projects/nginx_project/nginx.conf:/etc/nginx/nginx.conf -d nginx:1.28.0-alpine