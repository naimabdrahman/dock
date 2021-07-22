## https://yacht.sh/docs/Installation/Getting_Started
# alternative to portainer

docker run -dit -p 8000:8000 -v /var/run/docker.sock:/var/run/docker.sock -v yacht:/config selfhostedpro/yacht

# u admin@yacht.local
# p pass 
