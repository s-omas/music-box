#!/bin/bash

# exit on error
set -e
# turn on command echoing
set -v
# make sure that the current directory is the once where this script is
cd ${0%/*}

exec_str="../../../../music_box config.json"

if ! $exec_str; then
  echo FAIL
  exit 1
else
  if cmp -s "output.csv" "expected_output.csv"; then
    echo PASS
    exit 0
  else
    echo unexpected results
    echo FAIL
    exit 1
  fi
fi
