#!/usr/bin/env sh
set -e
DIR=~/Downloads
MIRROR=https://github.com/helmfile/helmfile/releases/download
APP=helmfile

dl() {
    local ver=$1
    local lchecksums=$2
    local os=$3
    local arch=$4
    local archive_type=${5:-tar.gz}
    local platform="${os}_${arch}"
    local file="${APP}_${ver}_${platform}.${archive_type}"
    # https://github.com/helmfile/helmfile/releases/download/v0.145.2/helmfile_0.145.2_linux_amd64.tar.gz
    local url=$MIRROR/v$ver/$file
    printf "    # %s\n" $url
    printf "    %s: sha256:%s\n" $platform $(grep $file $lchecksums | awk '{print $1}')
}

dl_ver() {
    local ver=$1
    # https://github.com/helmfile/helmfile/releases/download/v0.145.2/helmfile_0.145.2_checksums.txt
    local url="${MIRROR}/v${ver}/${APP}_${ver}_checksums.txt"
    local lchecksums="$DIR/${APP}_${ver}_checksums.txt"
    if [ ! -e $lchecksums ];
    then
        curl -sSLf -o $lchecksums $url
    fi

    printf "  # %s\n" $url
    printf "  '%s':\n" $ver

    dl $ver $lchecksums darwin amd64
    dl $ver $lchecksums darwin arm64
    dl $ver $lchecksums linux 386
    dl $ver $lchecksums linux arm64
    dl $ver $lchecksums linux amd64
    dl $ver $lchecksums windows 386
    dl $ver $lchecksums windows amd64
    dl $ver $lchecksums windows arm64
}

dl_ver ${1:-0.168.0}
