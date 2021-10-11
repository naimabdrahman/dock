## install docker ce on ubuntu

# method 1
'''
apt-get remove docker docker-engine docker.io containerd runc
apt-get install apt-transport-https ca-certificates curl software-properties-common
#apt-get install apt-transport-https ca-certificates curl gnupg lsb-release
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu hirsute stable"
#apt-cache policy docker-ce
#apt-get update
apt-get install docker-ce docker-ce-cli containerd.io
systemctl status docker
'''



# method 2


apt-get remove docker docker-engine docker.io containerd runc
apt-get install apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
#curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
apt-get update
apt-get -y install docker-ce docker-ce-cli containerd.io
