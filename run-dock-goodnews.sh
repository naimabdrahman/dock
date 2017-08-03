#docker run -d -v /data/goodnews/html:/var/www/html -p 8080:80 goodnews:v1 httpd -D FOREGROUND
docker run -d -v /data/goodnews/html:/var/www/html -p 8080:80 naimar/goodnews:v2
