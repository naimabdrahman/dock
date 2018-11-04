## script to maintain health fspn-epl-2018 at port 8082
## to restart container if 8082 timeout more than 5 secs

curl -m 5 http://localhost:8082
#if test $? -ne 0; then echo -e "error"; else echo -e "fine" > /dev/null ; fi
if test $? -ne 0; then docker restart 28c6624d896a ; else echo -e "fine" >> /dev/null ; fi
