#!/bin/bash

cd x86_64
rm -rf *.db.*
rm -rf *.db
rm -rf *.files.*
rm -rf *.files
repo-add --sign --new --remove vineelsai-arch-repo.db.tar.gz *.pkg.tar.zst
