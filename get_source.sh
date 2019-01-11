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


if [ ! -d ${CODE_ROOT}/tf_toolbox ]; then
 git clone https://github.com/jackd/tf_toolbox.git ./code/tf_toolbox
fi

