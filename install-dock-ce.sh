## install docker ce on centos 7 & 8 & 9

## dependencies
yum -y install epel-release
yum -y install yum-utils


#yum -y update
yum -y remove docker docker-common docker-selinux docker-engine
yum install -y yum-utils device-mapper-persistent-datahttps://github.com/naimabdrahman/dock/stargazers lvm2
yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
#yum makecache fast
yum -y install docker-ce
service docker start
systemctl enable docker #chkconfig docker on

## pip3 is used instead
# install pip3
#yum -y install python-pip
yum -y install python3-pip
# Upgrade pip
pip3 install --upgrade pip3 ; pip3 install --upgrade pip

# compose
#pip install docker-compose
#pip3 install docker-compose


# compose - install via curl
#curl -L https://github.com/docker/compose/releases/download/v2.7.0/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
curl -L https://github.com/docker/compose/releases/download/v2.27.1/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
