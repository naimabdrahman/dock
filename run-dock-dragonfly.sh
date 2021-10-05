## supernode
docker pull dragonflyoss/supernode:0.3.1

docker run -dit -p 8001:8001 -p 8002:8002 dragonflyoss/supernode:0.3.1 -Dsupernode.advertiseIp=127.0.0.1


cat > /etc/docker/daemon.json <<EOF
{
    "registry-mirrors": ["http://127.0.0.1:65001","http://127.0.0.1:65002"]
}
EOF

systemctl restart docker



## dfclient
docker pull dragonflyoss/dfclient:0.3.1
docker run -d --name dfclient01 --rm -p 65001:65001 dragonflyoss/dfclient:0.3.1 --registry https://index.docker.io
docker run -d --name dfclient02 --rm -p 65002:65001 dragonflyoss/dfclient:0.3.1 --registry https://index.docker.io

