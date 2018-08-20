#!/bin/bash
CPU_COUNT=$(cat /proc/cpuinfo |grep processor |wc -l)
USE_CPUS=$((CPU_COUNT -2))
nvidia-docker run -it --rm --cpuset-cpus="0-${USE_CPUS}" \
 -v /tmp/.X11-unitx:/tmp./X11-unix -e DISPLAY=$DISPLAY \
 -v /bigdata/study/shapenet/v1:/shapenet \
 -v ${PWD}/run_data:/run_data \
 -v ${PWD}/code:/code \
 3dreconstruct:latest /bin/bash
