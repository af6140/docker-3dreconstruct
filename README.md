# Docker environment for the paper  "Learning Free-Form Deformations for 3D Object Reconstruction"

## Requirements
* docker-ce enging
* nvidia-docker 2.x
* nvidia driver > 384

## Setup

1. Build docker container

```bash
./build.sh
```

The container will mount ./code as /code in the container,so intermediate data will be saved there.

2. Checkout code

```bash
./get_sources.sh
```

3. Run container in interactive mode

```bash
./run_bash.sh
```

4. Verify tensorflow gpu usage

```bash
sudo python /root/ts_gpu_info.py
```

## Details

The requirements.txt will be used by pip to install all the dependencies.