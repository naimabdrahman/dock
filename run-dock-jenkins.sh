#docker run -dit --rm --name jenkins -p 8080:8080 -p 50000:50000 -v /home/jenkins:/var/jenkins_home jenkins/jenkins
docker run -dit --rm --name jenkins --net=host -v /data/jenkins:/var/jenkins_home jenkins/jenkins
