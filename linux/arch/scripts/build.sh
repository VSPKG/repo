cd packages

# build Checkout
cd Checkout
makepkg
cp *.pkg.tar.zst ../../x86_64
cd ..

# build RCE
cd RCE
makepkg
cp *.pkg.tar.zst ../../x86_64
cd ..

# build VMN
cd VMN
makepkg
cp *.pkg.tar.zst ../../x86_64
cd ..
