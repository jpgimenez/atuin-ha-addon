FROM ghcr.io/atuinsh/atuin:18.16.0

USER root

RUN apk add --no-cache bash curl jq

COPY run.sh /run.sh
RUN chmod +x /run.sh

ENTRYPOINT ["/run.sh"]