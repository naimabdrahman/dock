## Create docker lvm thinpool on centos 7 manually
## /dev/sdb1 should have been fdisked initially

pvcreate /dev/sdb1
vgcreate docker /dev/sdb1
lvcreate --wipesignatures y -n thinpool docker -l 95%VG
lvcreate --wipesignatures y -n thinpoolmeta docker -l 1%VG
lvconvert -y --zero n -c 512K --thinpool docker/thinpool --poolmetadata docker/thinpoolmeta


touch /etc/lvm/profile/docker-thinpool.profile
echo -e 'activation {' > /etc/lvm/profile/docker-thinpool.profile
echo -e '  thin_pool_autoextend_threshold=80' >> /etc/lvm/profile/docker-thinpool.profile
echo -e '  thin_pool_autoextend_percent=20' >> /etc/lvm/profile/docker-thinpool.profile
echo -e '}' >> /etc/lvm/profile/docker-thinpool.profile


lvchange --metadataprofile docker-thinpool docker/thinpool
lvs -o+seg_monitor

service docker stop
mkdir /var/lib/docker.bk
mv /var/lib/docker/* /var/lib/docker.bk


touch /etc/docker/daemon.json
echo -e '{' > /etc/docker/daemon.json
echo -e '    "storage-driver": "devicemapper",' >> /etc/docker/daemon.json
echo -e '    "storage-opts": [' >> /etc/docker/daemon.json
echo -e '    "dm.thinpooldev=/dev/mapper/docker-thinpool",' >> /etc/docker/daemon.json
echo -e '    "dm.use_deferred_removal=true",'>> /etc/docker/daemon.json
echo -e '    "dm.use_deferred_deletion=true"' >> /etc/docker/daemon.json
echo -e '    ]' >> /etc/docker/daemon.json
echo -e '}' >> /etc/docker/daemon.json


service docker restart

