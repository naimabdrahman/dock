## script to run elk in docker mode
## prerequisite: elk in docker mode should've been installed first and memory should've been configured

docker rm -f elk
docker run -p 5601:5601 -p 9200:9200 -p 5044:5044 -it --name elk sebp/elk


