docker run -dit --name grafana --rm -v grafana-varlib:/var/lib/grafana -v grafana-etc:/etc/grafana -v grafana-varlog:/var/log/grafana -p 3000:3000 grafana/grafana
