FROM rust:1.67

WORKDIR /usr/src/gpuinfo
COPY rust/gpuinfo_api/. .

#     -v /share/ZFS531_DATA/.qpkg/NVIDIA_GPU_DRV/usr:/usr/local/nvidia \
#    -v /share/ZFS531_DATA/.qpkg/NVIDIA_GPU_DRV/cuda-11.7:/usr/cuda \
RUN mkdir /usr/local/nvidia
RUN mkdir /usr/cuda

COPY /share/ZFS531_DATA/.qpkg/NVIDIA_GPU_DRV/usr /usr/local/nvidia
COPY /share/ZFS531_DATA/.qpkg/NVIDIA_GPU_DRV/cuda-11.7 /usr/cuda

#RUN ./build.sh
RUN RUSTFLAGS='-L /usr/local/nvidia/lib -L /usr/local/nvidia/syslib -L /usr/local/nvidia/applib -L /usr/cuda/lib64' cargo install --path .
#RUN cargo install --path .

CMD ["gpuinfo_api"]

