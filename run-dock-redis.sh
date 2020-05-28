## run redis on host 

docker run -dit --rm --net=host --name=redis redis

echo -e "

to test : 

==> redis-cli -h host -p port -a password
==> redis-cli -h x.x.x.x -p 6379 ping
==> redis-cli --latency -h 127.0.0.1 -p 6379
==> redis-cli monitor
==> redis-cli ping
==> redis-cli -h 127.0.0.1 -p 6379 ping
==> redis-cli --help
==> redis-cli -h localhost info Replication
==> redis-cli -h localhost -p 6379 info Replication
==> redis-cli -h localhost set k1 v1
==> redis-cli -h localhost get k1
==> redis-cli -h localhost flushall
==> redis-cli flushdb
==> redis-cli restart
==> redis-benchmark -q -n 100000
==> redis-benchmark

"


echo -e "
Redis cluster config below

## /etc/hosts
1.1.1.1 test1c master1
2.2.2.2 test2c slave2
3.3.3.3 test3c slave3

## redis.conf (master)
< bind 0.0.0.0
< protected-mode no

## redis.conf (slave)
< bind 0.0.0.0
< protected-mode no
< slaveof test1c 6379

## redis-sentinel.conf (all)
< protected-mode no
< sentinel monitor mymaster test1c 6379 2

"
