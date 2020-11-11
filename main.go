package main

import (
	"github.com/aws/aws-xray-sdk-go/xray"
	"github.com/micro/micro/v2/cmd"
)

func init() {

	xray.Configure(xray.Config{
		DaemonAddr: "xray-service.default:2000",
		LogLevel:   "info",
	})

}

func main() {
	cmd.Init()
}
