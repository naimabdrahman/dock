## https://hub.docker.com/r/sscaling/jmx-prometheus-exporter

#docker pull sscaling/jmx-prometheus-exporter
docker run --rm -p "5556:5556" -v "$PWD/config.yml:/opt/jmx_exporter/config.yml" sscaling/jmx-exporter
