# Use the NVIDIA CUDA base image with Ubuntu 20.04
FROM nvidia/cuda:11.7.1-base-ubuntu20.04 as base

# Set environment variables for non-interactive installations
ENV DEBIAN_FRONTEND=noninteractive

# Install system dependencies
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    build-essential \
    cuda-nvml-dev-11-7 \
    cmake \
    git \
    wget \
    curl \
    vim && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Install Rust
RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
ENV PATH="/root/.cargo/bin:${PATH}"

FROM base as builder

WORKDIR /usr/src/gpuinfo
COPY rust/gpuinfo_api/. .

# Build the Rust application
# /usr/local/cuda-11.7/targets/x86_64-linux/lib/stubs/libnvidia-ml.so
# RUN find / -name libnvidia-ml.so
RUN RUSTFLAGS='-L /usr/local/cuda-11.7/targets/x86_64-linux/lib -L /usr/local/cuda-11.7/targets/x86_64-linux/lib/stubs' \
  cargo build --release

RUN RUSTFLAGS='-L /usr/local/cuda-11.7/targets/x86_64-linux/lib -L /usr/local/cuda-11.7/targets/x86_64-linux/lib/stubs' \
  cargo install --path .

# Expose any ports if needed
EXPOSE 3030

CMD ["gpuinfo_api"]


