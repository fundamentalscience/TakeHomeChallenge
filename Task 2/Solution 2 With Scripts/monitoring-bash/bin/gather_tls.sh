#!/usr/bin/env bash
# Measures TLS handshake throughput and p95 handshake duration

set -euo pipefail
HOST="127.0.0.1"
PORT=443
SAMPLES=50
LOG_DIR="$(dirname "${BASH_SOURCE[0]}")/../logs"
mkdir -p "$LOG_DIR"
tmpfile=$(mktemp)

for _ in $(seq 1 "$SAMPLES"); do
  { time openssl s_client -connect "${HOST}:${PORT}" -servername "$HOST" -brief < /dev/null; } \
    2>&1 | grep real | awk '{print $2}' >> "$tmpfile"
done

HPS=$(wc -l <"$tmpfile")          # handshakes per batch (~per run)
P95=$(sort -n "$tmpfile" | awk -v p=0.95 '{a[NR]=$1} END {print a[int(NR*p)]}')
printf "%s,hps,%s\n"            "$TS" "$HPS" >> "$LOG_DIR/tls.csv"
printf "%s,handshake_p95,%s\n"  "$TS" "$P95" >> "$LOG_DIR/tls.csv"
rm -f "$tmpfile"
