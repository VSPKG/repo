VERSION="0.0.1"

CONTROL="Package: dwm
Version: ${VERSION}
Architecture: amd64
Maintainer: Vineel Sai <mail@vineelsai.com>
Description: dwm is an extremely fast, small, and dynamic window manager for X.
"

cd build
if [ -d "suckless" ]; then
    cd suckless/dwm
    git pull
else
    git clone https://github.com/vineelsai26/suckless
    cd suckless/dwm
fi

make all
mkdir -p dwm_${VERSION}_amd64/usr/local/bin && mkdir -p dwm_${VERSION}_amd64/DEBIAN
cp dwm dwm_${VERSION}_amd64/usr/local/bin
printf "$CONTROL" > dwm_${VERSION}_amd64/DEBIAN/control
chmod -R 0775 dwm_${VERSION}_amd64
dpkg-deb --build --root-owner-group dwm_${VERSION}_amd64
cp dwm_${VERSION}_amd64.deb ../../../pool/main
