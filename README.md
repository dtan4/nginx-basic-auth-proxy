# Docker image of Nginx Proxy with Basic Auth

[![Docker Repository on Quay](https://quay.io/repository/dtan4/nginx-basic-auth-proxy/status "Docker Repository on Quay")](https://quay.io/repository/dtan4/nginx-basic-auth-proxy)

Simple HTTP Proxy with Basic Authentication

```
       w/ user:pass   +------------------------+      +-------------+
User ---------------> | nginx-basic-auth-proxy | ---> | HTTP Server |
                      +------------------------+      +-------------+
```

## Run

```bash
$ docker run \
    --rm \
    --name nginx-basic-auth-proxy \
    -p 8080:80 \
    -e BASIC_AUTH_USERNAME=username \
    -e BASIC_AUTH_PASSWORD=password \
    -e PROXY_PASS=https://www.google.com \
    -e SERVER_NAME=proxy.dtan4.net \
    quay.io/dtan4/nginx-basic-auth-proxy
```

Access to http://localhost:8080 , then browser asks you username and password.

You can also try complete HTTP-proxy example using Docker Compose.
hello-world web application cannot be accessed without authentication.

```bash
$ docker-compose up
# http://localhost:8080/
# - Username: username
# - Password: password
```

## Environment variables

### Required

|Key|Description|
|---|---|
|`BASIC_AUTH_USERNAME`|Basic auth username|
|`BASIC_AUTH_PASSWORD`|Basic auth password|
|`PROXY_PASS`|Proxy destination URL|

### Optional

|Key|Description|Default|
|---|---|---|
|`SERVER_NAME`|Value for `server_name` directive|`example.com`|
|`WORKER_PROCESSES`|Value for `worker_processes` directive|`auto`|

## Author

Daisuke Fujita ([@dtan4](https://github.com/dtan4))

## License

[![MIT License](http://img.shields.io/badge/license-MIT-blue.svg?style=flat)](LICENSE)
