#!/bin/bash
set -e

CPU_ARCH=$(uname -m)

mkdir -p packages
cd packages

# build Checkout
rm -rf pkgbuild.checkout
git clone https://github.com/VSPKG/pkgbuild.checkout.git
cd pkgbuild.checkout
makepkg --clean --force --sign
cp *.pkg.tar.* ../../${CPU_ARCH}/
cp *.pkg.tar.*.sig ../../${CPU_ARCH}/
cd ..

# build RCE
rm -rf pkgbuild.rce
git clone https://github.com/VSPKG/pkgbuild.rce.git
cd pkgbuild.rce
makepkg --clean --force --sign
cp *.pkg.tar.* ../../${CPU_ARCH}/
cp *.pkg.tar.*.sig ../../${CPU_ARCH}/
cd ..

# build VMN
rm -rf pkgbuild.vmn
git clone https://github.com/VSPKG/pkgbuild.vmn.git
cd pkgbuild.vmn
makepkg --clean --force --sign
cp *.pkg.tar.* ../../${CPU_ARCH}/
cp *.pkg.tar.*.sig ../../${CPU_ARCH}/
cd ..

# build yay
mkdir -p yay
cd yay
rm -rf pkg src yay
curl -Lsm 10 -o PKGBUILD "https://aur.archlinux.org/cgit/aur.git/plain/PKGBUILD?h=yay-bin" || exit 1
sed -i PKGBUILD \
    -e 's|^pkgname=yay-bin$|pkgname=yay|' \
    -e '/^conflicts=/a \conflicts+=(yay-git yay-bin)' \
    -e '/^package() {$/a \  rm -f ../${pkgname}_${pkgver}_$CARCH.tar.gz'
makepkg --clean --force --sign
cp *.pkg.tar.* ../../${CPU_ARCH}/
cp *.pkg.tar.*.sig ../../${CPU_ARCH}/
cd ..
rm -rf yay
