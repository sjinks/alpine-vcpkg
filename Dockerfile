FROM alpine:3.24.4@sha256:f59abe656b692d901e184be3445e084786602108599d2a51d229c0f5a48c71bf

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
