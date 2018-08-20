FROM nvidia/cudagl:9.0-devel
#FROM tensorflow/tensorflow:1.8.0-gpu

ARG HOST_UID
ARG HOST_GID


COPY ts_gpu_info.py /root 
COPY requirements.txt /root

RUN  apt-get update && apt-get install -y  --no-install-recommends locales git vim libxt6 python-pip python-dev libcudnn7 blender sudo && \
  ln -s /usr/local/cuda/lib64/stubs/libcuda.so /usr/local/cuda/lib64/libcuda.so.1 && \
  locale-gen en_US.UTF-8 && \
  update-locale  LANG=en_US.UTF-8 && \
  pip install -U pip==9.0.3 &&  \
  pip install setuptools && \
  LD_LIBRARY_PATH=/usr/local/cuda/lib64 pip install -r /root/requirements.txt  && \
  groupadd -g ${HOST_GID} nvidia  && \
  useradd -g ${HOST_GID} -u ${HOST_UID} -s /bin/bash -c "Nividia User" -m -d /home/nvidia nvidia  &&\
  mkdir /code && chown -R nvidia:nvidia /code && \ 
  echo "nvidia ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/nvidia  && \
  echo export PYTHONPATH=$PYTHONPATH:/code > /home/nvidia/.bash_profile && \
  echo export SHAPENET_CORE_PATH=/shapenet

VOLUME /code
VOLUME /shapenet

WORKDIR /code
USER nvidia