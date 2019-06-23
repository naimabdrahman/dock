## simplesaml docker (SSO application)
## refer to https://hub.docker.com/r/jnyryan/simplesamlphp/ for details

## To access the web site
## http://localhost:8080/simplesaml
## https://localhost:8443/simplesaml

## username: admin
## password: password

docker run -d -p 8080:80 -p 8443:443 jnyryan/simplesamlphp
