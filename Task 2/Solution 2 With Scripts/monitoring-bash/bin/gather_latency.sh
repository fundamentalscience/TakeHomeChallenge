#!/usr/bin/env bash
# Probes end-to-end latency for the first target in targets.conf

set -euo pipefail
CONFIG_DIR="$(dirname "${BASH_SOURCE[0]}")/../config"
LOG_DIR="$(dirname "${BASH_SOURCE[0]}")/../logs"
mkdir -p "$LOG_DIR"

TARGET=$(head -n1 "$CONFIG_DIR/targets.conf")
curl -s -o /dev/null -w "%{time_total}\n" "$TARGET" >> /tmp/_lat.log
P95=$(tail -100 /tmp/_lat.log | sort -n | awk '{a[NR]=$1} END {print a[int(NR*0.95)]}')
printf "%s,latency_p95,%s\n" "$TS" "$P95" >> "$LOG_DIR/latency.csv"
