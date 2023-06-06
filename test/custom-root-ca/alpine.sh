#!/bin/bash

set -e

source dev-container-features-test-lib

check "Cert installed" test /usr/local/share/ca-certificates/custom-root-ca.crt
check "Cert linked" ls -alh /etc/ssl/certs | grep custom-root-ca.crt

reportResults