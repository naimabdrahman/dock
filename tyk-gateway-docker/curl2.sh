curl -H "x-tyk-authorization: foo" -s http://localhost:8080/tyk/reload/group | python -mjson.tool
