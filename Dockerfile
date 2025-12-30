FROM alpine:3.23.2@sha256:865b95f46d98cf867a156fe4a135ad3fe50d2056aa3f25ed31662dff6da4eb62

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
