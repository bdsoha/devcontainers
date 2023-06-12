#!/bin/bash

set -e

source dev-container-features-test-lib

check "Cert 1 installed" test /usr/local/share/ca-certificates/custom.sub.crt
check "Cert 2 installed" test /usr/local/share/ca-certificates/custom-1.sub.crt

check "Cert 1 linked" ls -alh /etc/ssl/certs | grep custom.sub.crt
check "Cert 2 linked" ls -alh /etc/ssl/certs | grep custom-1.sub.crt

reportResults