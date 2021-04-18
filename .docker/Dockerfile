FROM golang:1.14-alpine AS builder
WORKDIR /go/src/
# Download module
COPY go.mod go.sum ./
RUN cat go.mod
RUN go mod download -x
# Build
COPY . .
RUN CGO_ENABLED=0 GOOS=linux go build -o micro main.go plugin.go

FROM alpine:latest 
RUN apk --no-cache add ca-certificates
WORKDIR /root/
COPY --from=builder /go/src/micro .
ENV MICRO_CLIENT=grpc MICRO_SERVER=grpc
EXPOSE 8080
ENTRYPOINT ["./micro", "api", "--namespace=platflo.grpc", "--cors-allowed-methods=POST,GET,PUT,DELETE", "--cors-allowed-origins=*", "--enable_rpc=true", "--enable_cors=true", "--address=0.0.0.0:8080"]