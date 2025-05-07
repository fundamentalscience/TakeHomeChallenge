#!/usr/bin/env bash
# Collects Requests-per-second and active connections from Nginx stub_status

set -euo pipefail
URL="http://127.0.0.1/status"
LOG_DIR="$(dirname "${BASH_SOURCE[0]}")/../logs"
mkdir -p "$LOG_DIR"

read -r ACTIVE <<<"$(curl -s "$URL" | awk '/Active/ {print $NF}')"
read -r REQ1 <<<"$(curl -s "$URL" | awk 'NR==3 {print $1}')"
sleep 1
read -r REQ2 <<<"$(curl -s "$URL" | awk 'NR==3 {print $1}')"

RPS=$(( REQ2 - REQ1 ))
printf "%s,rps,%s\n"      "$TS" "$RPS"   >> "$LOG_DIR/rps.csv"
printf "%s,active,%s\n"   "$TS" "$ACTIVE">> "$LOG_DIR/rps.csv"
