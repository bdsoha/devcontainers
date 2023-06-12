#!/bin/sh

set -e

fatal()
{
    echo "⛔ " "$@" >&2
    exit 1
}

set_insecure_flag() {
    local downloader=$1
    flag=""

    if [ "${VERIFY}" = "false" ]; then
        echo "🙈 Ignoring security verification"

        case $downloader in
            curl)
                flag="--insecure"
                ;;
            wget)
                flag="--no-check-certificate"
                ;;
            *)
                fatal "Incorrect downloader executable [${downloader}]"
                ;;
        esac
    fi
}

download() {
    local source=$1
    local name=$2

    echo "⏬ Downloading certificate from ${source}"
    echo "📁 Save certificate to ${name}"

    if [ -x "$(which wget)" ] ; then
        set_insecure_flag wget
        wget -q $flag $source -O $name
    elif [ -x "$(which curl)" ]; then
        set_insecure_flag curl
        curl -sfL $flag $source -o $name
    else
        fatal "Could not find curl or wget, please install one."
    fi
}

create_bundle() {
    local filename=$1

    if [ "${BUNDLE}" = "true" ]; then
        local bundle="${filename}.bundle.crt"

        echo "📦 Creating certificate bundle ${bundle}"
        cat $(ls -1 -d "${dest_dir}/"* | grep "${filename}.*") > "${dest_dir}/${bundle}"
    fi
}

echo "🔛 Activating feature '🔒 custom-root-ca'"

counter=0
filename=$(echo $NAME | cut -d . -f 1)
extension=$(echo $NAME | cut -d . -f 2-)
certs=$(echo $SOURCE | tr ',' '\n')
dest_dir=/usr/local/share/ca-certificates

mkdir -p $dest_dir

for i in $certs; do
    if [ $counter -eq 0 ]; then
        download ${i} "${dest_dir}/${filename}.${extension}"
    else
        download ${i} "${dest_dir}/${filename}-${counter}.${extension}"
    fi

    counter=$((counter+1))
done

create_bundle $filename

update-ca-certificates
