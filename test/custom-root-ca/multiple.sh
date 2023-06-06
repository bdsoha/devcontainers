#!/bin/bash

set -e

source dev-container-features-test-lib

check "Cert 1 installed" bash -c "ls /usr/local/share/ca-certificates/custom.sub.crt"
check "Cert 2 installed" bash -c "ls /usr/local/share/ca-certificates/custom-1.sub.crt"

check "Cert 1 linked" bash -c "ls -alh /etc/ssl/certs | grep custom.sub.crt"
check "Cert 2 linked" bash -c "ls -alh /etc/ssl/certs | grep custom-2.sub.crt"

reportResults