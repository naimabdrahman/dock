## run pgbouncer on docker 
## reference : https://github.com/edoburu/docker-pgbouncer


## func pgb01
def func_pgb01(){
docker run -dit --rm \
    -e DATABASE_URL="postgres://user:pass@postgres-host/database" \
    -p 5432:5432 \
    edoburu/pgbouncer
}


## func pgb02
def func_pgb02(){
docker run -dit --rm \
    -e DB_USER=user \
    -e DB_PASSWORD=pass \
    -e DB_HOST=postgres-host \
    -e DB_NAME=database \
    -p 5432:5432 \
    edoburu/pgbouncer
}



## func pgb03 ==> run on local ==> switched on
def func_pgb03(){
docker run -dit --rm \
    -e DB_USER=user \
    -e DB_PASSWORD=pass \
    -e DB_HOST=localhost \
    -e DB_NAME=database \
    --net=host \
    edoburu/pgbouncer
}
func_pgb03



## test
echo -e "
to test.. pls run 
==> psql 'postgresql://user:pass@localhost/dbname'

"
