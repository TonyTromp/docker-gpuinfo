#!/bin/bash

#cd /src/gpuinfo_api/ && cargo build --release
cd /src/gpuinfo_api/ && cargo install --path . --root / --verbose

which gpuinfo_api
/bin/gpuinfo_api
