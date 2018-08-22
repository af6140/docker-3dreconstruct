#FROM nvidia/cudagl:9.0-devel
#https://www.tensorflow.org/install/install_sources
# good version compatibility matrix
#FROM nvidia/cuda:9.0-cudnn7-devel-ubuntu16.04
FROM tensorflow/tensorflow:1.8.0-gpu

ARG HOST_UID
ARG HOST_GID


COPY ts_gpu_info.py /root
COPY requirements.txt /root

RUN  apt-get update && apt-get install -y  --no-install-recommends locales git vim libxt6 python-pip python-dev blender sudo && \
  locale-gen en_US.UTF-8 && \
  update-locale  LANG=en_US.UTF-8 && \
  pip install -U pip==9.0.3 &&  \
  pip install setuptools && \
  groupadd -g ${HOST_GID} nvidia  && \
  useradd -g ${HOST_GID} -u ${HOST_UID} -s /bin/bash -c "Nividia User" -m -d /home/nvidia nvidia  &&\
  mkdir /code && chown -R nvidia:nvidia /code && \
  echo "nvidia ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/nvidia  && \
  echo export PYTHONPATH=$PYTHONPATH:/code > /home/nvidia/.bash_profile

RUN apt-get install -y libcudnn7 cuda-toolkit-9-0

RUN  LD_LIBRARY_PATH=/usr/local/cuda/lib64 pip install -r /root/requirements.txt
  #ln -s /usr/local/cuda/lib64/stubs/libcuda.so /usr/local/cuda/lib64/libcuda.so.1

VOLUME /code
VOLUME /shapenet

ENV LC_ALL=en_US.UTF-8
ENV LANG=en_US.UTF-8
ENV LANGUAGE=en_US.UTF-8
ENV CUDA_HOME=/usr/local/cuda
ENV SHAPENET_CORE_PATH=/shapenet

COPY entrypoint.sh /usr/local/bin/entrypoint.sh

WORKDIR /code
USER nvidia


ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
CMD ["/bin/true"]

