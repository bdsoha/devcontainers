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

counter=0
filename=$(echo $NAME | cut -d . -f 1)
extension=$(echo $NAME | cut -d . -f 2-)
certs=$(echo $SOURCE | tr ',' '\n')
dest_dir=/usr/local/share/ca-certificates/extras

mkdir -p $dest_dir

for i in $certs; do
    if [ $counter -eq 0 ]; then
        download ${i} "${dest_dir}/${filename}.${extension}"
    else
        download ${i} "${dest_dir}/${filename}-${counter}.${extension}"
    fi

    counter=$((counter+1))
done

if [ "${BUNDLE}" = "true" ]; then
    echo "📦 Creating certificate bundle ${filename}.bundle.crt"
    cat $(ls -1 $dest_dir) > "${dest_dir}/${filename}.bundle.crt"
fi

update-ca-certificates
