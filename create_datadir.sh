#!/bin/bash
# bo be run inside container

DATA_ROOT=/run_data
CODE_ROOT=/code

DATA_DIRS="template_ffd/data/_ids template_ffd/inference/_inferences template_ffd/model/_model shapenet/core/blender_renderings/_images shapenet/core/meshes/_meshes shapenet/core/point_clouds/_point_clouds shapenet/core/voxels/_data"

for DATA_DIR in $DATA_DIRS; do
 echo "Create symlink for $DATA_DIR"
 if [ ! -d ${DATA_ROOT}/${DATA_DIR} ]; then
   mkdir -p ${DATA_ROOT}/${DATA_DIR}
 fi
 echo "ln -s /code/${DATA_DIR} ${DATA_ROOT}/${DATA_DIR}"
done
