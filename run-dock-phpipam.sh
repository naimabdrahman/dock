## phpipam

## db
#docker run -dit --rm --name phpipam-mysql -e MYSQL_ROOT_PASSWORD=password -v /my_dir/phpipam:/var/lib/mysql  mysql:5.6  ## with colume
docker run -dit --rm --name phpipam-mysql -e MYSQL_ROOT_PASSWORD=password mysql:5.6 ## no volume


## app
docker run -dit --rm --name ipam -p 80:80 -e MYSQL_ENV_MYSQL_ROOT_PASSWORD=password --link phpipam-mysql:mysql pierrecdn/phpipam
