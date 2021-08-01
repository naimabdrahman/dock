## run docker gitlab
## ref ==> https://stackoverflow.com/questions/60062065/gitlab-initial-root-password

docker run --detach \
    --hostname gitlab.example.com \
    --publish 443:443 --publish 80:80 --publish 8022:22 \
    --name gitlab \
    --restart always \
    --volume /srv/gitlab/config:/etc/gitlab \
    --volume /srv/gitlab/logs:/var/log/gitlab \
    --volume /srv/gitlab/data:/var/opt/gitlab \
    -e GITLAB_ROOT_EMAIL="root@local" \
    -e GITLAB_ROOT_PASSWORD="gitlab_root_password" \
    gitlab/gitlab-ee:latest
