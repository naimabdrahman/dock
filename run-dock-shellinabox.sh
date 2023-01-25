docker container run -dit \
        --name shellinabox \
        --restart always \
        -p 443:4200 \
        -e SIAB_USER=chillexbro \
        -e SIAB_PASSWORD=Kasihantam \
        -e SIAB_SUDO=true \
        -v $PWD/dev:/usr/src/dev \
        sspreitzer/shellinabox:latest
