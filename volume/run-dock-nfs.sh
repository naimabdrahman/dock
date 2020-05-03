docker run --rm -itd --name nfs \
  --privileged \
  -v /nfsdata/test:/nfs.1 \
  -e SHARED_DIRECTORY=/nfs.1 \
  -p 2049:2049 \
  itsthenetwork/nfs-server-alpine:latest
