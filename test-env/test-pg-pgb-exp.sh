docker run -dit --rm --name=pgb      --net=host -e DATABASE_URL="postgres://postgres:password@localhost/postgres"    edoburu/pgbouncer
docker run -dit --rm --name=postgres --net=host -e POSTGRES_PASSWORD=password postgres
docker run -dit --rm --name=exporter-pgb --net=host -v /root/config.yml:/etc/pgbouncer-exporter/config.yml spreaker/prometheus-pgbouncer-exporter
docker run -dit --rm --name=exporter-pg  --net=host -e DATA_SOURCE_NAME="postgresql://postgres:password@localhost:5432/postgres?sslmode=disable" wrouesnel/postgres_exporter

echo -e "config.yml as follows"

echo -e "

# The host on which the exporter should listen to (defaults to 127.0.0.1)
exporter_host: 0.0.0.0

# The port on which the exporter should listen to (defaults to 9100)
exporter_port: 9797

# The list of pgbouncer instances to monitor
pgbouncers:
  -
    # The pgbouncer connection string. Supports environment variables replacement
    # Ie. \$(PGBOUNCER_PASS) is replaced with the content of \"PGBOUNCER_PASS\" environment
    #     variable if exist, or left untouched if doesn't exist
    dsn: postgres://postgres:password@localhost:5432/postgres


    # The pgbouncer connection timeout in seconds (defaults to 5 seconds)
    connect_timeout: 5

    # Databases to report metrics for. If omitted or empty, all databases
    # will be reported.
    include_databases:

    # Databases to exclude from metrics reporting. If omitted or empty, all
    # databases matching \"include_databases\" will be reported.
    exclude_databases:
      - pgbouncer
"
