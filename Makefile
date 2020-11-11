dev:
	MICRO_SERVER_NAME='$(PROJECT).grpc.gateway' MICRO_CLIENT=grpc MICRO_SERVER=grpc go run main.go plugin.go \
	--registry=consul api \
	--namespace='$(PROJECT).grpc' \
	--cors-allowed-origins=* \
	--cors-allowed-methods=POST,GET,PUT,DELETE \
	--enable_rpc=true --address=0.0.0.0:8080

dev-rest:
	CORS_ALLOWED_ORIGINS=cp-match.com MICRO_SERVER_NAME='$(PROJECT).rest.gateway' go run main.go plugin.go \
	--registry=consul api \
	--namespace='$(PROJECT).rest' \
	--cors-allowed-origins=* \
	--cors-allowed-methods=POST,GET,PUT,DELETE \
	--enable_cors=false \
	--enable_rpc=true \
	--handler=web --address=0.0.0.0:8081

dev-web:
	CORS_ALLOWED_ORIGINS=cp-match.com MICRO_SERVER_NAME='$(PROJECT).web.gateway' go run main.go plugin.go \
	--registry=consul web \
	--namespace='$(PROJECT).web' \
	--address=0.0.0.0:8082

build:
	go build -o micro main.go plugin.go