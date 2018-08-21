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

GPU capabilities: tensorflow only use gpu with capabilities > 3.5


## Hardware


### Query GPU/device capability

The cuda-samples package contains a demo program can be used to query gpu details.

```bash
cd /usr/local/cuda/samples/1_Utilities/deviceQuery
sudo make
sudo ./deviceQuery
```

The output will be like
```txt
 CUDA Device Query (Runtime API) version (CUDART static linking)

Detected 1 CUDA Capable device(s)

Device 0: "Quadro 4000"
  CUDA Driver Version / Runtime Version          9.0 / 9.0
  CUDA Capability Major/Minor version number:    2.0
  Total amount of global memory:                 1980 MBytes (2076049408 bytes)
MapSMtoCores for SM 2.0 is undefined.  Default to use 64 Cores/SM
MapSMtoCores for SM 2.0 is undefined.  Default to use 64 Cores/SM
  ( 8) Multiprocessors, ( 64) CUDA Cores/MP:     512 CUDA Cores
  GPU Max Clock rate:                            950 MHz (0.95 GHz)
  Memory Clock rate:                             1404 Mhz
  Memory Bus Width:                              256-bit
  L2 Cache Size:                                 524288 bytes
  Maximum Texture Dimension Size (x,y,z)         1D=(65536), 2D=(65536, 65535), 3D=(2048, 2048, 2048)
  Maximum Layered 1D Texture Size, (num) layers  1D=(16384), 2048 layers
  Maximum Layered 2D Texture Size, (num) layers  2D=(16384, 16384), 2048 layers
  Total amount of constant memory:               65536 bytes
  Total amount of shared memory per block:       49152 bytes
  Total number of registers available per block: 32768
  Warp size:                                     32
  Maximum number of threads per multiprocessor:  1536
  Maximum number of threads per block:           1024
  Max dimension size of a thread block (x,y,z): (1024, 1024, 64)
  Max dimension size of a grid size    (x,y,z): (65535, 65535, 65535)
  Maximum memory pitch:                          2147483647 bytes
  Texture alignment:                             512 bytes
  Concurrent copy and kernel execution:          Yes with 2 copy engine(s)
  Run time limit on kernels:                     Yes
  Integrated GPU sharing Host Memory:            No
  Support host page-locked memory mapping:       Yes
  Alignment requirement for Surfaces:            Yes
  Device has ECC support:                        Disabled
  Device supports Unified Addressing (UVA):      Yes
  Supports Cooperative Kernel Launch:            No
  Supports MultiDevice Co-op Kernel Launch:      No
  Device PCI Domain ID / Bus ID / location ID:   0 / 3 / 0
  Compute Mode:
     < Default (multiple host threads can use ::cudaSetDevice() with device simultaneously) >

deviceQuery, CUDA Driver = CUDART, CUDA Driver Version = 9.0, CUDA Runtime Version = 9.0, NumDevs = 1
Result = PASS

```