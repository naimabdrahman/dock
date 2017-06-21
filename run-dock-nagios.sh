docker run -d -p 8025:25 -p 80:80 quantumobject/docker-nagios


#to access the container please use :
#$ docker exec -it container_id  /bin/bash


#to replace password :
#$ htpasswd -c /usr/local/nagios/etc/htpasswd.users nagiosadmin

#note: to access site is http://server_ip:external_container_port/nagios/

