FROM alpine:3.23.4@sha256:5b10f432ef3da1b8d4c7eb6c487f2f5a8f096bc91145e68878dd4a5019afde11

RUN \
    apk add --no-cache \
        autoconf \
        automake \
        bash \
        build-base \
        clang \
        clang-analyzer \
        clang-bash-completion \
        clang-ccache \
        clang-extra-tools \
        cmake \
        compiler-rt \
        curl \
        git \
        libc++ \
        libc++-dev \
        libc++-static \
        libtool \
        linux-headers \
        lld \
        llvm \
        ninja-build \
        ninja-is-really-ninja \
        perl \
        pkgconf \
        unzip \
        zip

ENV \
    VCPKG_FORCE_SYSTEM_BINARIES=1 \
    VCPKG_DISABLE_METRICS=1

RUN \
    git clone https://github.com/microsoft/vcpkg.git /vcpkg && \
    cd /vcpkg && \
    ./bootstrap-vcpkg.sh -disableMetrics && \
    ln -s /vcpkg/vcpkg /usr/local/bin/vcpkg

ENV VCPKG_ROOT=/vcpkg
