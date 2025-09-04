# alpine-vcpkg

This project provides a Docker-based environment for cross-compiling C++ projects using [vcpkg](https://github.com/microsoft/vcpkg) on Alpine Linux. It includes custom triplets and toolchains for building for various platforms, including Linux, macOS, and Windows (x86, x64, arm64).

## Features
- **Dockerized build environment** for reproducible cross-compilation
- **Custom vcpkg triplets** for multiple platforms:
  - x86-linux, x86-mingw, x64-mingw, x64-osx, arm64-linux, arm64-osx
- **Predefined toolchains** for each target
- Easy integration with CMake

## Project Structure
```
.
├── Dockerfile                    # Base Dockerfile
├── Dockerfile.cross              # Dockerfile for cross-compilation
└── vcpkg-custom-triplets/
    ├── [triplet files]           # Custom vcpkg triplets
    └── toolchains/
        ├── [toolchain files]     # CMake toolchain files
        └── common.cmake          # Common toolchain settings
```

## Images

- `ghcr.io/sjinks/alpine-vcpkg`: Alpine Linux with `vcpkg` and build tools installed;
- `ghcr.io/sjinks/alpine-vcpkg-cross`: Alpine Linux with `vcpkg`, build tools, and triplets/toolchains for cross-compilation (x86-linux, x86-mingw, x64-mingw, x64-osx, arm64-linux, arm64-osx)

All images are `amd64`.

## Usage

1. Build the Docker Image
```sh
docker build -t alpine-vcpkg .
```

or

```sh
docker build -t alpine-vcpkg-cross -f Dockerfile.cross .
```

2. Run the Container
```sh
docker run --rm -it -v "$PWD:/src" alpine-vcpkg-cross
```

or

```sh
docker run --rm -it -v "$PWD:/src" alpine-vcpkg
```

3. Build Your Project

Something like
```sh
cmake -B build \
    -DCMAKE_TOOLCHAIN_FILE="/vcpkg/scripts/buildsystems/vcpkg.cmake" \
    -DVCPKG_CHAINLOAD_TOOLCHAIN_FILE="/vcpkg-custom-triplets/toolchains/arm64-osx-cross-toolchain.cmake" \
    -DVCPKG_TARGET_TRIPLET="arm64-osx-cross"
cmake --build build
```

## Customization
- Add or modify triplets in `vcpkg-custom-triplets/` for new platforms.
- Update toolchain files in `vcpkg-custom-triplets/toolchains/` as needed.
