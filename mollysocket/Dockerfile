ARG BUILD_FROM=ghcr.io/home-assistant/base-debian:trixie
# hadolint ignore=DL3006
FROM ${BUILD_FROM}

ARG BUILD_ARCH
ARG BUILD_VERSION
ARG MOLLYSOCKET_VERSION=${BUILD_VERSION:-1.7.1}

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        ca-certificates \
        wget \
        libssl3t64 \
        libsqlite3-0 \
    && rm -rf /var/lib/apt/lists/* \
    && case "${BUILD_ARCH}" in \
        amd64) BIN="linux_amd64" ;; \
        aarch64) BIN="linux_arm64" ;; \
        *) BIN="linux_${BUILD_ARCH}" ;; \
    esac \
    && wget -qO /usr/local/bin/mollysocket \
        "https://github.com/mollyim/mollysocket/releases/download/${MOLLYSOCKET_VERSION}/mollysocket-${BIN}" \
    && chmod +x /usr/local/bin/mollysocket

COPY rootfs /