## run on 4cpu 8gb ram

# no persistent volume
#docker run -dit --privileged --restart=unless-stopped -p 80:80 -p 443:443 rancher/rancher

# with persistent volume
docker run -dit --privileged --restart=unless-stopped --name rancher -p 80:80 -p 443:443 -v ranch:/var/lib/rancher rancher/rancher
