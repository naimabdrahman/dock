docker service create --name swarm1 --mount type=bind,source=/data/goodnews/html,target=/var/www/html --replicas=2 -p 8080:80 naimar/goodnews:v2


docker service create --name swarm2 --mount type=bind,source=/mnt/data/fspn-epl-2018/strawpoll.db,target=/python-nar/fspn-epl-2018/strawpoll.db --replicas=2 -p 8081:5000 fspn-epl-2018


docker service create --name swarm3 --mount type=bind,source=/mnt/data/oc/html,target=/var/www/html --replicas=2 -p 8082:80 owncloud
