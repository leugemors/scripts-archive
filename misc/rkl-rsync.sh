#!/usr/bin/env bash

# to do: check if the target has been mounted

SYNC="rsync -avzP --delete"

# skip virtualbox
DIRS="cursus files iddink prive projects websites"

SOURCE="/data"
TARGET="/media/rkl/BACKUP_UZORI/richard"

for DIR in $DIRS; do
    $SYNC $SOURCE/$DIR $TARGET/
done

