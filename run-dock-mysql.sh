docker run \
--detach \
--name=mysql-server \
--env="MYSQL_ROOT_PASSWORD=mypassword" \
--publish 6603:3306 \
--volume=/data/mysql/dir:/var/lib/mysql \
mysql
