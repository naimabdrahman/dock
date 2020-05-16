docker run --rm -itd --name nfs \
  --privileged \
  -v /nfsdata/test:/nfs.1 \
  -e SHARED_DIRECTORY=/nfs.1 \
  -p 2049:2049 \
  itsthenetwork/nfs-server-alpine:latest

echo -e "

run below to test mount (create dir /mnt/temp if not available);  

mount -t nfs4 127.0.0.1:/ /mnt/temp

or 

docker run -dit --rm --name client --volume-driver=nfs -v 10.0.2.15:/mount alpine /bin/sh ##virtualbox


or


docker run -dit --rm --name client --volume-driver=nfs -v 127.0.0.1:/mount alpine ## localhost


"
