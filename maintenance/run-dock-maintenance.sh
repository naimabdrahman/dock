docker run -d --rm \
  --name maintenance \
  -p 8080:80 \
  -v /root/lab/maintenance:/usr/share/nginx/html:ro \
  nginx:alpine

