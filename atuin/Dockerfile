FROM ghcr.io/atuinsh/atuin:18.16.0

USER root

COPY run.sh /run.sh
RUN chmod +x /run.sh

ENTRYPOINT ["/run.sh"]