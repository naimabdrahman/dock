## run-dock-registry ** with SSL
## requirement - SSL  need to be setup earlier separately


docker run -dit \
  --restart=always \
  --rm --name registry \
  -v /etc/pki/tls/certs:/certs \
  -e REGISTRY_HTTP_ADDR=0.0.0.0:443 \
  -e REGISTRY_HTTP_TLS_CERTIFICATE=/certs/dock.crt \
  -e REGISTRY_HTTP_TLS_KEY=/certs/dock.key \
  -p 443:443 \
  registry:latest

