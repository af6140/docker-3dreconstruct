#!/bin/bash
# bo be run inside container

DATA_ROOT=/run_data
CODE_ROOT=/code

DATA_DIRS="template_ffd/data/_ids template_ffd/inference/_inferences template_ffd/model/_model shapenet/core/blender_renderings/_images shapenet/core/meshes/_meshes shapenet/core/point_clouds/_point_clouds shapenet/core/voxels/_data"

#for DATA_DIR in $DATA_DIRS; do
 #echo "Create symlink for $DATA_DIR"
 #mkdir -p ${DATA_ROOT}/${DATA_DIR}
 #echo "ln -s ${DATA_ROOT}/${DATA_DIR}  /code/${DATA_DIR}"
#done

exec "$@"
