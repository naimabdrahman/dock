docker run --name freeipa-server-container -ti \
   -h ipa.example.test \
   -v /sys/fs/cgroup:/sys/fs/cgroup:ro \
   --tmpfs /run --tmpfs /tmp \
   -v /var/lib/ipa-data:/data:Z freeipa-server [ opts ]
