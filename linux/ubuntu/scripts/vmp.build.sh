#!/bin/bash
set -e

CPU_ARCH=$(dpkg --print-architecture)

cd build
if [ -d "VMP" ]; then
    cd VMP
    git pull
else
    git clone https://github.com/vineelsai26/VMP
    cd VMP
fi

VERSION="$(git describe --tags --abbrev=0 | cut -c2-)"

CONTROL="Package: vmp
Version: ${VERSION}
Architecture: ${CPU_ARCH}
Maintainer: Vineel Sai <mail@vineelsai.com>
Description: A Program to manage Python versions
"

cargo build --release

mkdir -p vmp_${VERSION}_${CPU_ARCH}/usr/local/bin && mkdir -p vmp_${VERSION}_${CPU_ARCH}/DEBIAN
cp target/release/vmp vmp_${VERSION}_${CPU_ARCH}/usr/local/bin
printf "$CONTROL" >vmp_${VERSION}_${CPU_ARCH}/DEBIAN/control
chmod -R 0775 vmp_${VERSION}_${CPU_ARCH}
dpkg-deb --build --root-owner-group vmp_${VERSION}_${CPU_ARCH}
cp vmp_${VERSION}_${CPU_ARCH}.deb ../../pool/main
