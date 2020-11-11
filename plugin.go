package main

import (
	"github.com/micro/go-plugins/micro/cors/v2"
	_ "github.com/micro/go-plugins/registry/consul/v2"
	"github.com/micro/micro/v2/client/api"
)

func init() {
	api.Register(cors.NewPlugin())
}
