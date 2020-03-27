#!/bin/sh
set -e # Fail on Error

printf "Begin Testing: "

source ./field_test.sh
source ./check_test.sh
source ./logic_test.sh

printf "\nEnding\n"