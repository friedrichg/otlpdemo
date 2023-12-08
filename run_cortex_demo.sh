#!/bin/bash -ex
#export IMAGE=cortexproject/cortex:v1.16.0
export IMAGE=cortexproject/cortex:OTLP-24a66fcc4
docker stop cortex || true
docker run -d --rm --name cortex --network host -v $PWD/cortex.yml:/config.yaml $IMAGE --config.file /config.yaml
OTEL_EXPORTER_OTLP_ENDPOINT=http://localhost:9009/api/v1/otlp go run .
