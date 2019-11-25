## run redis on host 

docker run -dit --rm --net=host --name=redis redis

echo -e "

to test : 

==> redis-cli -h host -p port -a password

==> redis-cli -h x.x.x.x -p 6379 ping

"
