pvcreate /dev/sdb1
vgcreate docker /dev/sdb1
lvcreate --wipesignatures y -n thinpool docker -l 95%VG
lvcreate --wipesignatures y -n thinpoolmeta docker -l 1%VG
lvconvert -y --zero n -c 512K --thinpool docker/thinpool --poolmetadata docker/thinpoolmeta


vi /etc/lvm/profile/docker-thinpool.profile

activation {
  thin_pool_autoextend_threshold=80
  thin_pool_autoextend_percent=20
}


lvchange --metadataprofile docker-thinpool docker/thinpool
lvs -o+seg_monitor

service docker stop
mkdir /var/lib/docker.bk
mv /var/lib/docker/* /var/lib/docker.bk

touch /etc/docker/daemon.json
{
    "storage-driver": "devicemapper",
    "storage-opts": [
    "dm.thinpooldev=/dev/mapper/docker-thinpool",
    "dm.use_deferred_removal=true",
    "dm.use_deferred_deletion=true"
    ]
}
