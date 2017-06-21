docker run --name wordpress --link mysql-server:mysql -p 8080:80 -d wordpress
