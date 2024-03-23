## sample kafka, kafka connect
- run
```
docker compose up
```
- once all services are up, add source and sink connector configuration
```
curl -i -X POST -H "Content-Type:application/json" -d @sink.json http://localhost:8083/connectors
curl -i -X POST -H "Content-Type:application/json" -d @source.json http://localhost:8083/connectors

```

- in mysql1
```
 create db db1
 create table xxx
```

- insert records, it will be reflected in mysql2

## debugging
- in schema-registry container
```
kafka-avro-console-consumer --bootstrap-server localhost:9092 \
  --topic bbb.db1.xxx \
  --property schema.registry.url=http://schema-registry:8081 \
  --from-beginning
```
- check connector status
```
curl localhost:8083/connectors/<your-connector-name>/status
```

- delete connector
```
curl -X DELETE localhost:8083/connectors/mysql-sink-connector
```
