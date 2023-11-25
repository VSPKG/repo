#!/bin/bash

CPU_ARCH=$(uname -m)

cd ${CPU_ARCH}
rm -rf *.db.*
rm -rf *.db
rm -rf *.files.*
rm -rf *.files
repo-add --sign --new --remove vineelsai-arch-repo.db.tar.gz
