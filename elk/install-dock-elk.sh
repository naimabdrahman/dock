## install elk stack on docker on centos 7
## tested with 4GB ram machine. elasticsearch run with adjusted vm.max_map_count

# installation
docker pull sebp/elk
sysctl -w vm.max_map_count=262144  # could be adjust manually. located in run-dock-elk.sh
echo "vm.max_map_count=262144" >> /etc/sysctl.conf # # could be adjust manually. located in run-dock-elk.sh
sleep 2


# running elk
docker run -p 5601:5601 -p 9200:9200 -p 5044:5044 -it --name elk sebp/elk



# explore elk published ports
echo -e "#######################################"
echo -e "5601 (Kibana web interface)"
echo -e "9200 (Elasticsearch JSON interface)"
echo -e "5044 (Logstash Beats interface, receives logs from Beats such as Filebeat)"
echo -e "#######################################"


# Additional info
echo -e "\n\n\nadditional info"
echo -e "https://elk-docker.readthedocs.io/"
