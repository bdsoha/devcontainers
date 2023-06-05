#!/bin/sh

set -e

echo "Activating feature '🔒 custom-root-ca'"

download() {
    url=$1
    filename=$2

    if [ -x "$(which wget)" ] ; then
        wget -q $url -O $filename
    elif [ -x "$(which curl)" ]; then
        curl -sfL $url -o $filename
    else
        echo "Could not find curl or wget, please install one."
        exit 1
    fi
}

mkdir -p /usr/local/share/ca-certificates

download ${SOURCE} /usr/local/share/ca-certificates/${NAME}

update-ca-certificates
