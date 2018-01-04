# Create docker lvm thinpool in centos 7
# Pls make sure dedicated disk is available (prerequisuite)
# This is used mostly for production. By default the loopback is being used standard docker storage 

# stop docker service
systemctl stop docker


# delete loopback
rm -rf /var/lib/docker


# create new docker volume out of the disk & initiate
# in this case, the new disk is /dev/sdb
pvcreate /dev/sdb
vgcreate docker /dev/vdb 
echo VG="docker" >> /etc/sysconfig/docker-storage-setup
sleep 2
docker-storage-setup
systemctl start docker

# Verifcation
echo -e "\nTo verify pls run docker info\n"
                    
 
