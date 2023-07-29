VERSION="0.0.1"

CONTROL="Package: dmenu
Version: ${VERSION}
Architecture: amd64
Maintainer: Vineel Sai <mail@vineelsai.com>
Description: dmenu is an efficient dynamic menu for X.
"

cd build
if [ -d "suckless" ]; then
    cd suckless/dmenu
    git pull
else
    git clone https://github.com/vineelsai26/suckless
    cd suckless/dmenu
fi

make all
mkdir -p dmenu_${VERSION}_amd64/usr/local/bin && mkdir -p dmenu_${VERSION}_amd64/DEBIAN
cp dmenu dmenu_${VERSION}_amd64/usr/local/bin
printf "$CONTROL" > dmenu_${VERSION}_amd64/DEBIAN/control
chmod -R 0775 dmenu_${VERSION}_amd64
dpkg-deb --build --root-owner-group dmenu_${VERSION}_amd64
cp dmenu_${VERSION}_amd64.deb ../../../pool/main
