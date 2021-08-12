curl -v -H "x-tyk-authorization: foo" \
  -s \
  -H "Content-Type: application/json" \
  -X POST \
  http://localhost:8080/tyk/apis \
  -d '{
    "name": "Hello-World",
    "slug": "hello-world",
    "api_id": "Hello-World",
    "org_id": "1",
    "use_keyless": true,
    "auth": {
      "auth_header_name": "Authorization"
    },
    "definition": {
      "location": "header",
      "key": "x-api-version"
    },
    "version_data": {
      "not_versioned": true,
      "versions": {
        "Default": {
          "name": "Default",
          "use_extended_paths": true
        }
      }
    },
    "proxy": {
      "listen_path": "/hello-world/",
      "target_url": "http://echo.tyk-demo.com:8080/",
      "strip_listen_path": true
    },
    "active": true
}'
