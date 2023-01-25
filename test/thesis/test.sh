#!/bin/bash
cd $(dirname "$0")
source test-utils.sh

# Template specific tests
check "distro" lsb_release -c
check "thesis" [ $(cat /tmp/thesis.txt | grep result) ]

# Report result
reportResults
