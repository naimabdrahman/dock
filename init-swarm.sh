# to start init swarm mode on centos 7
docker swarm init  > /root/swarm-info.txt
cat /root/swarm-info.txt | sed -n 5p
