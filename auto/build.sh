#!/usr/bin/env sh

cd $(dirname $0)/..

docker build -t docker-with-supercronic:latest .
