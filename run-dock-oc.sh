## run owncloud with persistent volume
# in container : rsync -ahP /var/www/html into /temp (mounted)
# in container : set permission in /semp similar to /var/www/html
docker run -dit -p 80:80 -v /mnt/data/oc/html:/var/www/html --restart unless-stopped --name owncloud owncloud


## run owncloud without persistent volume
#docker run -dit -p 80:80 --name owncloud owncloud
