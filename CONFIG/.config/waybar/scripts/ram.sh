#!/bin/sh
used_kb=$(grep MemTotal /proc/meminfo | awk '{total=$2} END {print total}')
free_kb=$(grep MemAvailable /proc/meminfo | awk '{avail=$2} END {print avail}')
used_gb=$(echo "scale=2; ($used_kb - $free_kb)/1024/1024" | bc)
icon="🧠"
echo "{\"icon\": \"$icon\", \"ram_used_gb\": $used_gb}"
