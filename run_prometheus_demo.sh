#!/bin/bash -ex
export IMAGE=prom/prometheus:v2.47.2
docker stop prometheus || true
docker run -d --rm --name prometheus --network host -v $PWD/prometheus.yml:/config.yaml $IMAGE --enable-feature=otlp-write-receiver  --log.level=debug --config.file /config.yaml
OTEL_EXPORTER_OTLP_ENDPOINT=http://localhost:9090/api/v1/otlp go run .
