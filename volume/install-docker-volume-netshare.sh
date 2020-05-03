## install docker-volume-netshare on docker host
## note : to use nfs on docker swarm
## reference : https://sysadmins.co.za/docker-swarm-persistent-storage-with-nfs/




## install nfs-utils
yum install -y nfs-utils 


## install golang
curl https://raw.githubusercontent.com/naimabdrahman/shell/master/install-golang.sh | bash


## install docker-volume-netshare
cd ; go get github.com/ContainX/docker-volume-netshare
cd /root/go/src/github.com/ContainX/docker-volume-netshare
go build
scp -rp docker-volume-netshare /usr/local/bin/
#docker-volume-netshare nfs -a 1.40 ## to test docker-volume-netshare
cd



## create docker-volume-netshare service
touch /etc/systemd/system/docker-volume-netshare.service
cat > /etc/systemd/system/docker-volume-netshare.service <<EOL
[Unit]
Description=docker-volume-netshare

[Service]
User=root
ExecStart=/usr/local/bin/docker-volume-netshare nfs -a 1.40

[Install]
WantedBy=default.target
EOL


## enable service and run permanently
systemctl daemon-reload
systemctl enable docker-volume-netshare.service
systemctl start docker-volume-netshare.service
