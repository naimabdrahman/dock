## docker image for jfrog
## reference : https://www.jfrog.com/confluence/display/RTF/Installing+with+Docker

#docker run --name artifactory -d -p 8081:8081 docker.bintray.io/jfrog/artifactory-cpp-ce:latest

#docker run -dit --rm --name=jfrog --net=host docker.bintray.io/jfrog/artifactory-cpp-ce:latest

docker run --name artifactory -v jfrog:/var/opt/jfrog/artifactory -dit -p 8081:8081 -p 8082:8082 releases-docker.jfrog.io/jfrog/artifactory-cpp-ce:latest


