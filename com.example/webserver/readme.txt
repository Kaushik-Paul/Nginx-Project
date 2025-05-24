docker run --name nginx2 -p 8001:8080 --hostname ng1 \
-v /home/kaushik/Kaushik/Projects/Nginx-Project/com.example/webserver/nginx.conf:/etc/nginx/nginx.conf \
-v /home/kaushik/Kaushik/Projects/Nginx-Project/com.example/webserver/html:/usr/share/nginx/html \
-d nginx:1.28.0-alpine




docker exec nginx2 nginx -s reload
