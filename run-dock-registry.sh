## run-dock-registry ** with SSL
## requirement - SSL  need to be setup earlier separately


docker run -dit \
  --rm \
  --name registry \
  -v /etc/pki/tls/certs:/certs \
  -e REGISTRY_HTTP_ADDR=0.0.0.0:443 \
  -e REGISTRY_HTTP_TLS_CERTIFICATE=/certs/dock.crt \
  -e REGISTRY_HTTP_TLS_KEY=/certs/dock.key \
  -p 443:443 \
  registry:latest


## insecure registry ==> get images
# ref ==> https://stackoverflow.com/questions/31251356/how-to-get-a-list-of-images-on-docker-registry-v2
#curl -ikL -XGET https://X.X.X.X/v2/_catalog
#curl -ikL -XGET https://X.X.X.X/v2/ngx/tags/list
#curl -X GET -u <user>:<pass> https://myregistry:5000/v2/_catalog
#curl -X GET -u <user>:<pass> https://myregistry:5000/v2/ubuntu/tags/list
