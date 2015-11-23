#!/bin/bash

# Add the directory $PREFIX/lib to DYLD_FALLBACK_LIBRARY_PATH so that
# the library libspatialindex installed by conda is picked up
# (otherwise the import of rtree will fail).
#
# TODO: Check whether we need to do an equivalent thing on Linux!
#       What about Windows?!?

CURDIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
ROOTDIR=$(python -c "import re; print(re.sub('/etc/conda/activate.d', '', '$CURDIR'))")
LIBDIR=$ROOTDIR/lib

export DYLD_FALLBACK_LIBRARY_PATH=${LIBDIR}:$DYLD_FALLBACK_LIBRARY_PATH
