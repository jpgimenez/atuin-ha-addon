ARG BUILD_FROM=alpine:3.20
FROM ghcr.io/atuinsh/atuin:18.16.0 AS atuin

FROM ${BUILD_FROM}

RUN apk add --no-cache ca-certificates jq tzdata libgcc

# The official Atuin image ships the binary here in current releases.
COPY --from=atuin /usr/local/bin/atuin /usr/local/bin/atuin
COPY run.sh /run.sh

RUN chmod +x /run.sh

EXPOSE 8888
ENTRYPOINT ["/run.sh"]
