#!/bin/bash

# Test: devcontainer features test --features  custom-root-ca --remote-user root --skip-scenarios --base-image mcr.microsoft.com/devcontainers/base:ubuntu

set -e

source dev-container-features-test-lib

check "Cert installed" bash -c 'ls /usr/local/share/ca-certificates/custom-root-ca.crt'
check "Cert linked" bash -c 'ls -alh /etc/ssl/certs | grep custom-root-ca.crt'
check "Cert bundle" bash -c 'ls -alh /usr/local/share/ca-certificates/ | grep custom-root-ca.bundle.crt'

reportResults
