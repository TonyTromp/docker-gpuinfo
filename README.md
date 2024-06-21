# docker-gpuinfo
A JSON API to provide GPU information

I have created this project to show NVIDIA GPU information in Homeassistant.
As I am running lots of GPU powered docker container, i find it helpfull to know the active status (memory, temperature, wattage) to check on its usage.

## Building it
```
docker compose up -d
docker exec -ti gpuinfo_api bash

rm -f ~/.cargo/.package-cache
cd /src/gpuinfo_api
cargo build
cargo install
```

## Running it
docker compose run
```
# Get GPU temperature
curl localhost:3040/temperature

# Get GPU memory info
curl localhost:3040/memory

# Get GPU Processes (note you will need to set docker to host
curl localhost:3040/processes

# Get all information combined
curl localhost:3040/info

```

