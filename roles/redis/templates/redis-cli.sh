#!/usr/bin/env bash

sudo docker run \
  --interactive \
  --tty \
  --link redis.service \
  --rm \
  redis \
  redis-cli -h redis.service -p {{ redis_port }}
