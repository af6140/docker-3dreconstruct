#!/bin/bash
CPU_COUNT=$(cat /proc/cpuinfo |grep processor |wc -l)
USE_CPUS=$((CPU_COUNT -2))
SHAPENET_V1=/bigdata/study/shapenet/v1
nvidia-docker run -it --rm --cpuset-cpus="0-${USE_CPUS}" \
 -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY=$DISPLAY \
 -v ${SHAPENET_V1}:/shapenet \
 -v ${PWD}/code:/code \
 -p 127.0.0.1:6006:6006/tcp \
 3dreconstruct:latest /bin/bash -l
