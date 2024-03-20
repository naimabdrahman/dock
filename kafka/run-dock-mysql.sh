## db1
docker run \
--detach \
--name=mysql1 \
--env="MYSQL_ROOT_PASSWORD=password" \
--publish 127.0.0.1:3306:3306 \
--volume=/data/mysql1/dir:/var/lib/mysql \
mysql


## db2
docker run \
--detach \
--name=mysql2 \
--env="MYSQL_ROOT_PASSWORD=password" \
--publish 127.0.0.1:3307:3306 \
--volume=/data/mysql2/dir:/var/lib/mysql \
mysql






echo -e "
just in case id there is issue with encryption and access

GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY 'password';  flush privileges;
GRANT ALL PRIVILEGES ON *.* TO 'root'@'%';  flush privileges;

CREATE USER 'dba'@'%' IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON *.* TO 'dba'@'%';  flush privileges;

ALTER USER 'root'@'%' IDENTIFIED WITH mysql_native_password BY 'password';
#reference https://stackoverflow.com/questions/49194719/authentication-plugin-caching-sha2-password-cannot-be-loaded

try this: mysqladmin -u root -ppassword password newpassword

GRANT ALL PRIVILEGES ON *.* TO 'dba'@'%' WITH GRANT OPTION;
FLUSH PRIVILEGES;

login with ==> mysql -uroot -p<INSERT> -h127.0.0.1 -P3306
login with ==> mysql -uroot -p<INSERT> -h127.0.0.1 -P3307
"
