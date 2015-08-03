# /bin/bash

set -e

CURRENT_DIR=$(pwd)

for dir in $(find $CURRENT_DIR -name install.sh); do
    cd $(dirname $dir) && ./install.sh
done

cd $CURRENT_DIR
