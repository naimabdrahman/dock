## run kanbanboard 

## stateless
docker run -dit --name kanboard --rm -p 80:80 kanboard/kanboard

## volume binding
#docker run -dit --name kanboard --rm -p 80:80 -p 443:443 -v kanboard_data:/var/www/app/data -v kanboard_plugins:/var/www/app/plugins -v kanboard_ssl:/etc/nginx/ssl kanboard/kanboard
