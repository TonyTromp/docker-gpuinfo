#!/biin/bash

RUSTFLAGS='-L /usr/local/nvidia/lib -L /usr/local/nvidia/syslib -L /usr/local/nvidia/applib -L /usr/cuda/lib64' cargo build --release
