## install docker ce on centos 7

yum -y install epel-release
#yum -y update
yum remove docker docker-common docker-selinux docker-engine
yum install -y yum-utils device-mapper-persistent-data lvm2
yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
#yum makecache fast
yum -y install docker-ce
service docker start
chkconfig docker on

## pip3 is used instead
#yum -y install python-pip
yum -y install python3-pip
#pip install docker-compose
pip3 install docker-compose
