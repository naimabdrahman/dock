docker run -dit --name=vault --rm --net=host --cap-add=IPC_LOCK -e 'VAULT_DEV_ROOT_TOKEN_ID=myroot' -e 'VAULT_DEV_LISTEN_ADDRESS=0.0.0.0:8200' vault

###


echo -e"

next... do this 

docker exec -it vault sh
export VAULT_ADDR='http://127.0.0.1:8200'
export VAULT_TOKEN="myroot"

"



