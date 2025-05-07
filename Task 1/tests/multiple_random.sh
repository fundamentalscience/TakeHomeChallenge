#!/usr/bin/env bash
# Passes if two different permutations appear within 20 runs.
set -euo pipefail

script_path="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/random_numbers.sh"

baseline=$(bash "$script_path" | tr -d '\n')
different=0

# Try 19 more times; succeed once we see a new permutation.
for _ in {1..19}; do
  run=$(bash "$script_path" | tr -d '\n')
  if [[ "$run" != "$baseline" ]]; then
    different=1
    break
  fi
done

if [[ $different -eq 1 ]]; then
  echo "PASS: multiple_random.sh"
else
  echo "FAIL: Output seems deterministic"
  exit 1
fi
