#!/bin/bash
# bea-break-reminder.sh

# maximum órák száma folyamatos melóhoz
MAX_HOURS=8

# mennyi ideje vagy bejelentkezve (óra)
UPTIME_HOURS=$(awk '{print int($1/3600)}' /proc/uptime)

echo "⏱ Bea, folyamatos uptime: $UPTIME_HOURS óra"

if (( UPTIME_HOURS >= MAX_HOURS )); then
    echo "⚠️  Ideje egy kis pihenő! Lélegezz, kortyolj valamit, és nyújtózz!"
else
    echo "👍  Minden oké, dolgozhatsz tovább, de figyeld az időt."
fi

