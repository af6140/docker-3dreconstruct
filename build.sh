#!/bin/bash
HOST_UID=$(id -u)
HOST_GID=$(id -g)
docker image build --rm --build-arg HOST_UID=${HOST_UID} --build-arg HOST_GID=${HOST_GID} -t 3dreconstruct:latest -f Dockerfile --force-rm  ./
