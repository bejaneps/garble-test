package main

import (
	_ "github.com/alecthomas/chroma"
	_ "github.com/gorilla/mux"
	_ "github.com/machinebox/graphql"
	_ "github.com/matryer/is"
	_ "github.com/opentracing/opentracing-go"
	_ "github.com/openzipkin-contrib/zipkin-go-opentracing"
	_ "github.com/openzipkin/zipkin-go"
	_ "github.com/pkg/errors"
	_ "github.com/rs/zerolog"
	_ "github.com/spf13/cobra"
	_ "github.com/spf13/viper"
	_ "github.com/stoewer/go-strcase"
	_ "github.com/stretchr/testify"
	_ "github.com/valyala/quicktemplate"
	_ "gopkg.in/check.v1"
)

func main() {}