docker stop tyk-redis  tyk-gateway

docker network create tyk
sleep 5

docker run -dit --rm --name tyk-redis --network tyk -p 6379:6379 redis:5.0-alpine
sleep 30


docker run -dit \
  --rm \
  --name tyk-gateway \
  --network tyk \
  -p 8080:8080 \
  -v $(pwd)/tyk.standalone.conf:/opt/tyk-gateway/tyk.conf \
  -v $(pwd)/apps:/opt/tyk-gateway/apps \
  -v $(pwd)/middleware:/opt/tyk-gateway/middleware \
  -v $(pwd)/certs:/opt/tyk-gateway/certs \
  -e TYK_GW_SECRET=foo \
  docker.tyk.io/tyk-gateway/tyk-gateway:latest

