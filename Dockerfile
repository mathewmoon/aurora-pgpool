FROM alpine:latest
LABEL maintainer="Mathew Moon <me@mathewmoon.net>"

COPY ./pgpool.conf /etc/pgpool.conf
COPY ./pool_hba.conf /etc/pool_hba.conf
COPY ./docker_entry.sh /docker_entry.sh

RUN apk add --no-cache pgpool && \
    mkdir -p /var/run/pgpool && \
    mkdir -p /var/log/pgpool && \
    chmod +x /docker_entry.sh

ENTRYPOINT ["/docker_entry.sh"]

