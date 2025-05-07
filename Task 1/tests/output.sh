#!/usr/bin/env bash
# Passes if output contains exactly the numbers 1-10, once each.
set -euo pipefail

script_root="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
out=()

# ── Collect script output into the array "out" ──────────────────────────────
while IFS= read -r line; do
  out+=("$line")
done < <(bash "${script_root}/random_numbers.sh")
# ────────────────────────────────────────────────────────────────────────────

[[ ${#out[@]} -eq 10 ]] || { echo "FAIL: Expected 10 lines"; exit 1; }

for n in "${out[@]}"; do
  [[ $n =~ ^[1-9]$|^10$ ]] || { echo "FAIL: '$n' invalid"; exit 1; }
done

uniq_count=$(printf '%s\n' "${out[@]}" | sort -u | wc -l)
[[ $uniq_count -eq 10 ]] || { echo "FAIL: Duplicate numbers detected"; exit 1; }

echo "PASS: output.sh"
