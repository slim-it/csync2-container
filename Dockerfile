FROM ubuntu:26.04

ARG CSYNC2_VERSION=2.0-42-g83b3644-4

RUN apt-get update \
    && apt-get install --no-install-recommends -y \
      ca-certificates \
      csync2=${CSYNC2_VERSION} \
      sqlite3 \
    && rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["/usr/sbin/csync2"]
