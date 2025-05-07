#!/usr/bin/env bash
# Captures CPU, memory and NIC packet counters

set -euo pipefail
LOG_DIR="$(dirname "${BASH_SOURCE[0]}")/../logs"
mkdir -p "$LOG_DIR"

read -r CPU_USR CPU_SYS CPU_IRQ <<<"$(mpstat 1 1 | awk '/Average/ {print $4,$6,$13}')"
MEM_USED=$(free -m | awk '/Mem:/ {print $3}')
RX=$(cat /sys/class/net/eno1/statistics/rx_packets)
TX=$(cat /sys/class/net/eno1/statistics/tx_packets)

printf "%s,cpu_usr,%s\n"   "$TS" "$CPU_USR" >> "$LOG_DIR/sys.csv"
printf "%s,cpu_sys,%s\n"   "$TS" "$CPU_SYS" >> "$LOG_DIR/sys.csv"
printf "%s,cpu_irq,%s\n"   "$TS" "$CPU_IRQ" >> "$LOG_DIR/sys.csv"
printf "%s,mem_used_mb,%s\n" "$TS" "$MEM_USED" >> "$LOG_DIR/sys.csv"
printf "%s,rx_pps,%s\n"    "$TS" "$RX"       >> "$LOG_DIR/sys.csv"
printf "%s,tx_pps,%s\n"    "$TS" "$TX"       >> "$LOG_DIR/sys.csv"
