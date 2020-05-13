#!/usr/bin/env sh
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
        wget -q -O $lfile $url
    fi

    printf "    # %s\n" $url
    printf "    %s: sha256:%s\n" $platform $(sha256sum $lfile | awk '{print $1}')
}

dlver () {
    local ver=$1
    printf "  '%s':\n" $ver
    dl $ver linux amd64
    dl $ver darwin amd64
    dl $ver windows amd64
}

dlver ${1:-1.17.0}
