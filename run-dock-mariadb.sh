#docker run -d \
#  -p 3306:3306 \
#  million12/mariadb

docker run -d \
  -p 3306:3306 \
  -e MARIADB_USER="cactiuser" \
  -e MARIADB_PASS="password" \
  million12/mariadb

