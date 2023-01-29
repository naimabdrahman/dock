docker container run -dit \
        --name shellinabox \
        --restart always \
        -p 443:4200 \
        -e SIAB_USER=chillexbro \
        -e SIAB_PASSWORD=Kasihantam \
        -e SIAB_SUDO=true \
        -v $PWD/dev:/usr/src/dev \
        sspreitzer/shellinabox:latest


'''
docker container run -dit \
        --name shellinabox \
        --restart always \
        -p 80:4200 \
        -e SIAB_USER=chillexbro \
        -e SIAB_PASSWORD=Kasihantam \
        -e SIAB_SUDO=true \
        -e SIAB_SSL=false \
        -v $PWD/dev:/usr/src/dev \
        sspreitzer/shellinabox:latest

'''
