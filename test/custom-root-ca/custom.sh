#!/bin/bash

set -e

source dev-container-features-test-lib

not_exists() {
    if [ ! -f $1 ]; then echo '1'; else echo '0'; fi
}

check "Cert installed" test /usr/local/share/ca-certificates/custom.crt
check "Cert linked" ls -alh /etc/ssl/certs | grep custom.crt
check "No cert bundle" not_exists /usr/local/share/ca-certificates/custom.bundle.crt

reportResults