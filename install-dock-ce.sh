## install docker ce on centos 7

yum -y install epel-release
yum -y update
yum remove docker docker-common docker-selinux docker-engine
yum install -y yum-utils device-mapper-persistent-data lvm2
yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
#yum makecache fast
yum -y install docker-ce
service docker start
chkconfig docker on
yum -y install python-pip
pip install docker-compose
