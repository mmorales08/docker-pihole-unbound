ARG PIHOLE_VERSION
FROM pihole/pihole:${PIHOLE_VERSION:-latest}

ENV DEBIAN_FRONTEND=noninteractive 

RUN apk update && apk add unbound

COPY lighttpd-external.conf /etc/lighttpd/external.conf 
COPY unbound-pihole.conf /etc/unbound/unbound.conf.d/pi-hole.conf
COPY 99-edns.conf /etc/dnsmasq.d/99-edns.conf

RUN mkdir -p /etc/services.d/unbound
COPY unbound-run /etc/services.d/unbound/run

ENTRYPOINT ./s6-init