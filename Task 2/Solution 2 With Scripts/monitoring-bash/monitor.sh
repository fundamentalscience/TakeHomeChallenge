#!/usr/bin/env bash
# Orchestrator – launches all collectors in parallel
set -euo pipefail
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
export PATH="$DIR/bin:$PATH"
TS=$(date +%s)
export TS
gather_rps.sh  &
gather_tls.sh  &
gather_latency.sh &
gather_sys.sh &
wait
