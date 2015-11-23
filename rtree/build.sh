#!/bin/bash

export DYLD_FALLBACK_LIBRARY_PATH="$PREFIX/lib:$DYLD_FALLBACK_LIBRARY_PATH"
$PYTHON setup.py install

ACTIVATE_DIR=$PREFIX/etc/conda/activate.d
DEACTIVATE_DIR=$PREFIX/etc/conda/deactivate.d
mkdir -p $ACTIVATE_DIR
mkdir -p $DEACTIVATE_DIR

cp $RECIPE_DIR/osx/activate.sh $ACTIVATE_DIR/rtree-activate.sh
cp $RECIPE_DIR/osx/deactivate.sh $DEACTIVATE_DIR/rtree-deactivate.sh
