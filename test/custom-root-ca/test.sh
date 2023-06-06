#!/bin/bash

# Test: devcontainer features test --features  custom-root-ca --remote-user root --skip-scenarios --base-image mcr.microsoft.com/devcontainers/base:ubuntu

set -e

source dev-container-features-test-lib

check "Cert installed" test /usr/local/share/ca-certificates/custom-root-ca.crt
check "Cert linked" ls -alh /etc/ssl/certs | grep custom-root-ca.crt
check "Cert bundle" test /usr/local/share/ca-certificates/custom-root-ca.bundle.crt

reportResults
