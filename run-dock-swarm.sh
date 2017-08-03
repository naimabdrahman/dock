docker service create --name swarm1 --mount type=bind,source=/data/goodnews/html,target=/var/www/html --replicas=2 -p 8080:80 naimar/goodnews:v2
