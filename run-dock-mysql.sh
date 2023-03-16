docker run \
--detach \
--name=mysql-server \
--env="MYSQL_ROOT_PASSWORD=password" \
--publish 6603:3306 \
--volume=/data/mysql/dir:/var/lib/mysql \
mysql


echo -e "
just in case id there is issue with encryption and access

GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY 'password';  flush privileges;
GRANT ALL PRIVILEGES ON *.* TO 'root'@'%';  flush privileges;

CREATE USER 'dba'@'%' IDENTIFIED BY 'password' WITH GRANT OPTION;
GRANT ALL PRIVILEGES ON *.* TO 'dba'@'%' IDENTIFIED BY 'password';  flush privileges;

ALTER USER 'root'@'%' IDENTIFIED WITH mysql_native_password BY 'password';
#reference https://stackoverflow.com/questions/49194719/authentication-plugin-caching-sha2-password-cannot-be-loaded
"
