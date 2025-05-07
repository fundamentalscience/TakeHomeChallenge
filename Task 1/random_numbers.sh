#!/usr/bin/env bash
# ------------------------------------------------------------
# Prints the numbers 1-10 in random order, each exactly once.
# Pure Bash implementation – no external utilities required.
# ------------------------------------------------------------
set -euo pipefail

nums=(1 2 3 4 5 6 7 8 9 10)

for (( i=${#nums[@]}-1; i>0; i-- )); do
  j=$(( RANDOM % (i+1) ))
  tmp=${nums[i]}
  nums[i]=${nums[j]}
  nums[j]=$tmp
done

printf '%s\n' "${nums[@]}"
