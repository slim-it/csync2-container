FROM ubuntu:26.04

ARG CSYNC2_VERSION
LABEL org.opencontainers.image.title="csync2 container"
LABEL org.opencontainers.image.description="csync2 cluster file synchronization from the Ubuntu package"
LABEL org.opencontainers.image.source="https://github.com/slim-it/csync2-container"
LABEL org.opencontainers.image.version="${CSYNC2_VERSION}"

RUN test -n "${CSYNC2_VERSION}" \
    && apt-get update \
    && apt-get install --no-install-recommends -y \
      ca-certificates \
      csync2=${CSYNC2_VERSION} \
      sqlite3 \
    && rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["/usr/sbin/csync2"]
