#!/usr/bin/env sh
set -e

DIR=~/Downloads
MIRROR=https://github.com/jaegertracing/jaeger/releases/download

dl()
{
    local ver=$1
    local os=$2
    local arch=$3
    local platform="$os-$arch"
    local file=jaeger-$ver-$platform.tar.gz
    local url=$MIRROR/v$ver/$file
    local lfile=$DIR/$file

    if [ ! -e $lfile ];
    then
        curl -sSLf -o $lfile $url
    fi

    printf "    # %s\n" $url
    printf "    %s: sha256:%s\n" $platform $(sha256sum $lfile | awk '{print $1}')
}

dlver () {
    local ver=$1
    printf "  '%s':\n" $ver
    dl $ver darwin amd64
    dl $ver darwin arm64
    dl $ver linux amd64
    dl $ver linux arm64
    dl $ver linux ppc64le
    dl $ver linux s390x
}

dlver 1.60.0
dlver 1.61.0
dlver 1.62.0
dlver 1.63.0
dlver 1.64.0
dlver 1.65.0
dlver 1.66.0
dlver 1.67.0
dlver 1.68.0
dlver 1.69.0
dlver 1.70.0
dlver 1.71.0
dlver 1.72.0
dlver 1.73.0
dlver 1.74.0
dlver ${1:-1.75.0}
