#!/bin/bash

set -e

source dev-container-features-test-lib

check "Cert installed" bash -c "ls /usr/local/share/ca-certificates/custom-root-ca.crt"
check "Cert linked" bash -c "ls -alh /etc/ssl/certs | grep custom-root-ca.crt"

reportResults