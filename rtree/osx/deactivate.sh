#!/bin/bash

# Remove the directory $PREFIX/lib from DYLD_FALLBACK_LIBRARY_PATH again which
# was added during the 'activate' command.

CURDIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
ROOTDIR=$(python -c "import re; print(re.sub('/etc/conda/deactivate.d', '', '$CURDIR'))")
LIBDIR=$ROOTDIR/lib

export DYLD_FALLBACK_LIBRARY_PATH=$(echo $DYLD_FALLBACK_LIBRARY_PATH | sed -E "s|$LIBDIR:?||")
