# api-gateway
### Running api gateway on your pc as temporary 
#### For grpc api gateway
```
PROJECT={{project name or namespace}} make dev
```
#### For rest api gateway
```
PROJECT={{project name or namespace}} make dev-rest
```
#### For web gateway
```
PROJECT={{project name or namespace}} make dev-web
```
------
### Running api gateway on container 
#### Build grpc api gateway image
```
docker build -f .docker/Dockerfile -t api-grpc-gateway .
```

#### Start grpc api gateway container
```
docker run -p 8081:8080 \
    --env APP_ENV="alpha" \
    --env MICRO_SERVER_NAME="{{project name or namespace}}.grpc.gateway" \
    --env MICRO_CLIENT="grpc" \
    --env MICRO_SERVER="grpc" \
    --env MICRO_REGISTRY="consul" \
    --env MICRO_REGISTRY_ADDRESS="dev-consul:8500" \
    --env MICRO_CLIENT_REQUEST_TIMEOUT="15s" \
    --env CORS_ALLOWED_ORIGINS="domain.com" \
    --env GATEWAY_NAMESPACE="{{project name or namespace}}" \
    -d --restart always \
    --network devenv \
    --name api-grpc-gateway api-grpc-gateway
```

#### Build rest api gateway image
```
docker build -f .docker/Dockerfile.rest -t api-rest-gateway .
```
#### Start rest api gateway container
```
docker run -p 8081:8080 \
    --env APP_ENV="alpha" \
    --env MICRO_SERVER_NAME="{{project name or namespace}}.rest.gateway" \
    --env MICRO_REGISTRY="consul" \
    --env MICRO_REGISTRY_ADDRESS="dev-consul:8500" \
    --env MICRO_CLIENT_REQUEST_TIMEOUT="15s" \
    --env CORS_ALLOWED_ORIGINS="domain.com" \
    --env GATEWAY_NAMESPACE="{{project name or namespace}}" \
    -d --restart always \
    --network devenv \
    --name api-rest-gateway api-rest-gateway
```

#### Build rest api gateway image
```
docker build -f .docker/Dockerfile.web -t api-web-gateway .
```
#### Start rest api gateway container
```
docker run -p 8081:8080 \
    --env APP_ENV="alpha" \
    --env MICRO_SERVER_NAME="{{project name or namespace}}.web.gateway" \
    --env MICRO_REGISTRY="consul" \
    --env MICRO_REGISTRY_ADDRESS="dev-consul:8500" \
    --env MICRO_CLIENT_REQUEST_TIMEOUT="15s" \
    --env CORS_ALLOWED_ORIGINS="domain.com" \
    --env GATEWAY_NAMESPACE="{{project name or namespace}}" \
    -d --restart always \
    --network devenv \
    --name api-rest-gateway api-rest-gateway
```