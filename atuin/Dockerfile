# syntax=docker/dockerfile:1.6

ARG ATUIN_VERSION=18.16.0
ARG BUILD_FROM=ghcr.io/hassio-addons/debian-base:8.1.3

FROM ghcr.io/atuinsh/atuin:${ATUIN_VERSION} AS atuin

FROM ${BUILD_FROM}

COPY --from=atuin /usr/local/bin/atuin-server /usr/local/bin/atuin-server

RUN ldd /usr/local/bin/atuin-server || true

COPY run.sh /run.sh
RUN chmod +x /run.sh

CMD ["/run.sh"]