cd packages

# build Checkout
cd Checkout
rm -rf pkg src checkout
makepkg --clean --force --sign
cp *.pkg.tar.zst ../../x86_64
cd ..

# build RCE
cd RCE
rm -rf pkg src rce
makepkg --clean --force --sign
cp *.pkg.tar.zst ../../x86_64
cd ..

# build VMN
cd VMN
rm -rf pkg src vmn
makepkg --clean --force --sign
cp *.pkg.tar.zst ../../x86_64
cd ..
