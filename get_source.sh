#!/bin/bash
CODE_ROOT=./code

if [ ! -d $CODE_ROOT ]; then
 mkdir -p ${CODE_ROOT}
fi

if [ ! -d ${CODE_ROOT}/template_ffd ]; then
  git clone https://github.com/jackd/template_ffd.git ./code/template_ffd
fi

if [ ! -d ${CODE_ROOT}/dids ]; then
 git clone https://github.com/jackd/dids.git ./code/dids
fi

if [ ! -d ${CODE_ROOT}/util3d ]; then
 git clone git@github.com:af6140/util3d.git ./code/util3d
fi

if [ ! -d ${CODE_ROOT}/shapenet ]; then
  git clone https://github.com/jackd/shapenet.git ./code/shapenet
fi

if [ ! -d ${CODE_ROOT}/tf_nearest_neighbour ]; then
 git clone https://github.com/jackd/tf_nearest_neighbour.git ./code/tf_nearest_neighbour
fi

DATA_ROOT=./run_data

DATA_DIRS="template_ffd/data/_ids template_ffd/inference/_inferences template_ffd/model/_model shapenet/core/blender_renderings/_images shapenet/core/meshes/_meshes shapenet/core/point_clouds/_point_clouds shapenet/core/voxels/_data"

for DATA_DIR in $DATA_DIRS; do
 echo "Create symlink for $DATA_DIR"
 if [ ! -d ./${DATA_ROOT}/${DATA_DIR} ]; then
   mkdir -p ./${DATA_ROOT}/${DATA_DIR}
 fi
 echo "ln -s ./code/${DATA_DIR} ./${DATA_ROOT}/${DATA_DIR}"
done


