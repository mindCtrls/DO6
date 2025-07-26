#!/bin/bash

declare -i counter=0
declare -i failedCount=0

check() {
  local output=$(./DO "$1")
  
  if [[ "$output" == "$2" ]]; then
    echo -e "Test "$counter" \e[32m pass\e[0m"
  else
    echo -e "Test "$counter" \e[31m failure\e[0m"
    ((failedCount++))
  fi
  ((counter++))
}

check "-2" "asjdlahsdjasdh"
check "0.23" "Bad number!"
check "23" "Bad number!"

check "kqweljqwe" "Bad number!"

check "1" "Learning to Linux"
check "2" "Learning to work with Network"
check "3" "Learning to Monitoring"
check "4" "Learning to extra Monitoring"
check "5" "Learning to Docker"
check "6" "Learning to CI/CD"

if [ $failedCount -gt 0 ]; then
  exit 1 
fi