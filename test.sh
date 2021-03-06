#!/usr/bin/env bash

cd 10.6.0.1
docker-compose build ddk
cd ../test
docker-compose up --build -d ddk api db
docker-compose up test
rm -rf log.log
docker-compose logs ddk api >&1 >> log.log
docker-compose down --volumes
