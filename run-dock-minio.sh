## quick run minio docker
# reference : https://hub.docker.com/r/minio/minio/
# https://docs.min.io/docs/minio-docker-quickstart-guide.html


'''
# quick run
docker run -it -p 9000:9000 minio/minio server /data
'''

# detail run
docker run -dit \
  -p 9000:9000 \
  -p 9001:9001 \
  -v minio:/data \
  -e "MINIO_ROOT_USER=rootuser" \
  -e "MINIO_ROOT_PASSWORD=rootpassword" \
  --rm \
  --name minio \
  quay.io/minio/minio server /data --console-address ":9001"


# minio client
#docker run minio/mc ls play ## to test 
docker run -dit --entrypoint=/bin/sh --name mc --rm minio/mc

## minio command
#mc alias set minio http://x.x.x.x:9000 rootuser rootpassword
#mc ls minio
#mc mb minio/mybucket
#mc cp myobject.txt minio/mybucket
