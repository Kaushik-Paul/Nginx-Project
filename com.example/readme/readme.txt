// To spin up docker with custom nginx welcome page

docker run --name nginx -p 80:80 --hostname ng1 -v D:/Projects/nginx_project/html:/usr/share/nginx/html -d nginx:1.28.0-alpine