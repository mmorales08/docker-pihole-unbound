#!/bin/sh

mkdir -p /var/log/unbound
chown pihole:pihole /var/log/unbound

echo "[i] Starting Unbound"
/usr/sbin/unbound -d -c /etc/unbound/unbound.conf.d/pi-hole.conf &
UNBOUND_PID=$!

sleep 1
if ps -p "$UNBOUND_PID" > /dev/null 2>&1; then
    echo "[i] Unbound started  with PID $UNBOUND_PID"
else
    echo "[i] ERROR: Unbound failed to start. Check /var/log/unbound.log"
fi

exec /usr/bin/start.sh