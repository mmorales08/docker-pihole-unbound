#!/bin/bash
# Run this once: docker buildx create --use --name build --node build --driver-opt network=host
# Run this once to correct qemu issues on multi-arch builds: docker run --rm --privileged multiarch/qemu-user-static --reset -p yes -c yes
PIHOLE_VER=`cat VERSION`
docker buildx build --build-arg PIHOLE_VERSION=$PIHOLE_VER --platform linux/arm/v7,linux/arm64/v8,linux/amd64 -t mmorales08/docker-pihole-unbound:$PIHOLE_VER --push .
docker buildx build --build-arg PIHOLE_VERSION=$PIHOLE_VER --platform linux/arm/v7,linux/arm64/v8,linux/amd64 -t mmorales08/docker-pihole-unbound:latest --push .