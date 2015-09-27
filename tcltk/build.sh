#!/bin/bash

VER=$PKG_VERSION

if [ -z "$DISPLAY" ]; then
    echo "Error: variable DISPLAY not set. Aborting."
    exit 1
fi

wget http://downloads.sourceforge.net/project/tcl/Tcl/${VER}/tcl${VER}-src.tar.gz
wget http://downloads.sourceforge.net/project/tcl/Tcl/${VER}/tk${VER}-src.tar.gz

tar xzf tcl${VER}-src.tar.gz
tar xzf tk${VER}-src.tar.gz

cd $SRC_DIR/tcl${VER}/unix
./configure --prefix=$PREFIX --enable-threads --enable-64bit
make
make install

cd $SRC_DIR/tk${VER}/unix
./configure --with-tcl=$PREFIX/lib --prefix=$PREFIX --enable-aqua=yes --enable-threads --enable-64bit
make
make install

cd $PREFIX
rm -rf man share
