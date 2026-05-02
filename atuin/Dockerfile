# syntax=docker/dockerfile:1.6

ARG ATUIN_VERSION=18.16.0
ARG BUILD_FROM=ghcr.io/hassio-addons/base:17.2.4

FROM ghcr.io/atuinsh/atuin:${ATUIN_VERSION} AS atuin

FROM ${BUILD_FROM}

COPY --from=atuin /usr/local/bin/atuin-server /usr/local/bin/atuin-server

COPY run.sh /run.sh
RUN chmod +x /run.sh

CMD ["/run.sh"]