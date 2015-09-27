#!/bin/sh

sed -i -e "s|MAGPAR_HOME = \$(HOME)/magpar-0.9|MAGPAR_HOME = ${SRC_DIR}|" ${SRC_DIR}/src/Makefile.in.defaults

# Compile Magpar and all the dependencies which are bundled with it.
pushd ${SRC_DIR}/src
make -f Makefile.libs
make
popd

# Copy all sources and compiled files into $PREFIX/opt/magpar-0.9/
install -d ${PREFIX}/opt/magpar-0.9
cp -r ${SRC_DIR}/* ${PREFIX}/opt/magpar-0.9

# Set a symlink in $PREFIX/bin which points to the Magpar executable
# so that it appears in the path.
install -d ${PREFIX}/bin/
ln -s ../opt/magpar-0.9/src/magpar.exe ${PREFIX}/bin/magpar.exe
