#! /bin/bash
docker buildx build --platform=linux/amd64 --rm . -t somax/drone-ding:2022