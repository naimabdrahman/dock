docker run -dit --name=vault --rm --net=host --cap-add=IPC_LOCK -e 'VAULT_DEV_ROOT_TOKEN_ID=myroot' -e 'VAULT_DEV_LISTEN_ADDRESS=0.0.0.0:8200' vault

###


echo -e"

next... do this 

docker exec -it vault sh
export VAULT_ADDR='http://127.0.0.1:8200'
export VAULT_TOKEN="myroot"

"



## some api call for quick test ##

#curl     --header "X-Vault-Token: $VAULT_TOKEN"     http://127.0.0.1:8200/v1/secret/data/hello?version=5 | jq

#curl     --request POST     --data '{"key": "/ye2PeRrd/qruh9Ppu9EyUjk1vLqIflg1qqw6w9OE5E="}'     http://127.0.0.1:8200/v1/sys/unseal | jq

#curl http://127.0.0.1:8200/v1/sys/init

#curl     --header "X-Vault-Token: $VAULT_TOKEN"     --request POST     --data '{"type": "approle"}'     http://127.0.0.1:8200/v1/sys/auth/approle

#curl \
#    --header "X-Vault-Token: $VAULT_TOKEN" \
#    --request POST \
#    --data @payload.json \
#    http://127.0.0.1:8200/v1/secret/data/hello

