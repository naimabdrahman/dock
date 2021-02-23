## run on 4cpu 8gb ram
docker run -dit --privileged --restart=unless-stopped -p 80:80 -p 443:443 rancher/rancher
