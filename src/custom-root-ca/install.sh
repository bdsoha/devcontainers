#!/bin/sh

set -e

download() {
    source=$1
    name=$2

    echo "⏬ Downloading certificate from ${source}"
    echo "📁 Save certificate to ${name}"

    if [ -x "$(which wget)" ] ; then
        wget -q $source -O $name
    elif [ -x "$(which curl)" ]; then
        curl -sfL $source -o $name
    else
        echo "⛔ Could not find curl or wget, please install one."
        exit 1
    fi
}

echo "🔛 Activating feature '🔒 custom-root-ca'"

mkdir -p /usr/local/share/ca-certificates

counter=0
filename=$(echo $NAME | cut -d . -f 1)
extension=$(echo $NAME | cut -d . -f 2-)
certs=$(echo $SOURCE | tr ',' '\n')

for i in $certs; do
    if [ $counter -eq 0 ]; then
        download ${i} "/usr/local/share/ca-certificates/${filename}.${extension}"
    else
        download ${i} "/usr/local/share/ca-certificates/${filename}-${counter}.${extension}"
    fi

    counter=$((counter+1))
done

update-ca-certificates
