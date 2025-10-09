#!/usr/bin/env bash

# Verificar si existe una interfaz tun (OpenVPN suele usar tun0, tun1, etc)
vpn_iface=$(ip -o link show | awk -F': ' '/tun[0-9]/ {print $2; exit}')

if [ -n "$vpn_iface" ]; then
  # Si hay interfaz tunX, obtener IP asociada
  ip=$(ip -o -4 addr show "$vpn_iface" | awk '{print $4}' | cut -d/ -f1)
  if [ -n "$ip" ]; then
    echo "$ip"
  fi
fi
