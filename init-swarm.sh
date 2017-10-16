# to init swarm mode
docker swarm init  > swarm.txt
cat swarm.txt | sed -n 5p
