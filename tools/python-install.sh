#!/bin/bash
# Usage: 
#  $ ./python-install.sh install 3.7.3 ./python
#  $ ./python-install.sh altinstall 3.5.3 ./python
#  $ sudo ./python-install.sh altinstall 3.6.8

set -eu

INSTALL="$1"
VERSION="$2"
PREFIX=""
if test $# -ge 3; then
    PREFIX="$3"
fi

MISSING_PKG=""
for PKG in zlib1g-dev libffi-dev libssl-dev libncursesw5-dev libgdbm-dev liblzma-dev libsqlite3-dev tk-dev uuid-dev libreadline-dev; do
    if ! dpkg -l | grep -q "^ii  $PKG[: ]"; then
        MISSING_PKG="$MISSING_PKG $PKG"
        echo "Missing $PKG"
    fi
done
if test -n "$MISSING_PKG"; then
    sudo apt install $MISSING_PKG
fi

ARCHIVE_FILE=$(mktemp)
SRC_FOLDER=$(mktemp -d)

wget "https://www.python.org/ftp/python/$VERSION/Python-$VERSION.tar.xz" -O "$ARCHIVE_FILE"
tar -xJC "$SRC_FOLDER" --strip-components=1 -f "$ARCHIVE_FILE"
rm "$ARCHIVE_FILE"

if test -n "$PREFIX"; then
    if ! test -d "$PREFIX"; then
        mkdir -p "$PREFIX"
    fi
    PREFIX=$(realpath "$PREFIX")
    cd "$SRC_FOLDER"
    test -d "$PREFIX"
    ./configure --prefix "$PREFIX"
else
    cd "$SRC_FOLDER"
    ./configure
fi
make -j4
make $INSTALL
cd /tmp && rm -rf "$SRC_FOLDER"
