#!/usr/bin/env bash
set -euo pipefail

SERVICE_PATTERN="${SERVICE_PATTERN:-node}"
RPC_HOST="${RPC_HOST:-127.0.0.1}"
RPC_PORT="${RPC_PORT:-8545}"

section() { printf '\n== %s ==\n' "$1"; }

section "System"
uname -a
printf 'Uptime: '; uptime -p 2>/dev/null || uptime
printf 'Load: '; cat /proc/loadavg

section "Memory"
free -h

section "Disk"
df -hT / | sed -n '1,2p'

section "Docker"
if command -v docker >/dev/null 2>&1; then
  docker --version
  docker ps --format 'table {{.Names}}\t{{.Status}}\t{{.Ports}}' || true
else
  echo "docker: not installed"
fi

section "Matching systemd services"
if command -v systemctl >/dev/null 2>&1; then
  systemctl --no-pager --type=service --state=running 2>/dev/null | grep -i "$SERVICE_PATTERN" || echo "No running service matched: $SERVICE_PATTERN"
else
  echo "systemctl: unavailable"
fi

section "RPC reachability"
if timeout 3 bash -c "</dev/tcp/${RPC_HOST}/${RPC_PORT}" 2>/dev/null; then
  echo "reachable: ${RPC_HOST}:${RPC_PORT}"
else
  echo "unreachable: ${RPC_HOST}:${RPC_PORT}"
fi
