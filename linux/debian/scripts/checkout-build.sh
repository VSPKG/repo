VERSION="0.0.1"

CONTROL="Package: checkout
Version: ${VERSION}
Architecture: amd64
Maintainer: Vineel Sai <mail@vineelsai.com>
Description: A Program to checkout to Projects in different directories to your workspace
"

cd build
if [ -d "Checkout" ]; then
    cd Checkout
    git pull
else
    git clone https://github.com/vineelsai26/Checkout
    cd Checkout
fi
go build -buildvcs=false
mkdir -p checkout_${VERSION}_amd64/usr/local/bin && mkdir -p checkout_${VERSION}_amd64/DEBIAN
cp checkout checkout_${VERSION}_amd64/usr/local/bin
printf "$CONTROL" > checkout_${VERSION}_amd64/DEBIAN/control
chmod -R 0775 checkout_${VERSION}_amd64
dpkg-deb --build --root-owner-group checkout_${VERSION}_amd64
cp checkout_${VERSION}_amd64.deb ../../pool/main
