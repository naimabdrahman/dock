#docker run -dit --rm --name jenkins -p 8080:8080 -p 50000:50000 -v /home/jenkins:/var/jenkins_home jenkins/jenkins
docker run -dit --rm --name jenkins --net=host -v jenkins:/var/jenkins_home jenkins/jenkins # using host

## 
echo -e "

to use docker api or docker cloud with jeckins

in docker service
    /etc/systemd/system/multi-user.target.wants/docker.service

use 
    ExecStart=/usr/bin/dockerd -H tcp://0.0.0.0:2375 -H unix:///var/run/docker.sock 

"
