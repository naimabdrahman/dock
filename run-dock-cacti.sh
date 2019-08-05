docker run \
-d \
--name cacti \
-p 80:80 \
-p 443:443 \
--env="DB_ADDRESS=database_ip" \
--env="DB_USER=cactiuser" \
--env="DB_PASS=my_password" \
polinux/cacti
