#!/bin/bash

docker run -it \
    --runtime nvidia-runtime \
#    --gpus all \
    --device /dev/nvidia0:/dev/nvidia0 \
    --device /dev/nvidiactl:/dev/nvidiactl \
    --device /dev/nvidia-caps:/dev/nvidia-caps \
    --device /dev/nvidia-uvm:/dev/nvidia-uvm \
    -v $(pwd)/rust:/src \
    -v /share/ZFS531_DATA/.qpkg/NVIDIA_GPU_DRV/usr:/usr/local/nvidia \
    -v /share/ZFS531_DATA/.qpkg/NVIDIA_GPU_DRV/cuda-11.7:/usr/cuda \
    -e LD_LIBRARY_PATH=/usr/local/nvidia/lib:/usr/local/nvidia/syslib:/usr/local/nvidia/applib:/usr/cuda/lib64 \
    rust:1.67 bash




docker run -it \
    --runtime nvidia-runtime \
    --device /dev/nvidia0:/dev/nvidia0 \
    --device /dev/nvidiactl:/dev/nvidiactl \
    --device /dev/nvidia-caps:/dev/nvidia-caps \
    --device /dev/nvidia-uvm:/dev/nvidia-uvm \
    -v $(pwd)/rust:/src \
    -v /share/ZFS531_DATA/.qpkg/NVIDIA_GPU_DRV/usr:/usr/local/nvidia \
    -v /share/ZFS531_DATA/.qpkg/NVIDIA_GPU_DRV/cuda-11.7:/usr/cuda \
    -e LD_LIBRARY_PATH=/usr/local/nvidia/lib:/usr/local/nvidia/syslib:/usr/local/nvidia/applib:/usr/cuda/lib64 \
    rust:1.67 bash

#
# RUSTFLAGS='-L /usr/local/nvidia/lib -L /usr/local/nvidia/syslib -L /usr/local/nvidia/applib -L /usr/cuda/lib64' cargo build --release
#
# RUSTFLAGS='-L /db2-query/clidriver/lib' cargo build --release



