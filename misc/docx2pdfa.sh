#!/usr/bin/env bash
#############################################################################
##
##  simple script to automate the conversion of docx to pdf/a files
##
#############################################################################

# -eSelectPdfVersion=1 - PDF/A-1a
# -eSelectPdfVersion=2 - PDF/A-2b

# todo: add some testing
#       check if unoconv, python, lo, etc. are installed

SOURCE_DIR="docx"
TARGET_DIR="pdfa"
PDFA_VERSION="2"

printf "\nConverting all docx files to pdf/a-$PDFA_VERSION"
printf "\n====================================\n\n"

# apt-get install unoconv
UNOCONV=$(which unoconv)
if [ -z $UNOCONV ]; then
  printf "ERROR: Cannot find unoconv, please install it first.\n\n"
  exit 1
fi

# build a list of all word document to convert
LIST=$(ls ${SOURCE_DIR}/*.docx)
if [ -z "$LIST" ]; then
  printf "ERROR: Cannot find any documents to convert.\n\n"
  exit 1
fi

# the main process
for FILE in $LIST; do
  printf " * Working on: $FILE\n"
  unoconv -f pdf -eSelectPdfVersion=$PDFA_VERSION $FILE
done

# move all converted documents to a separate directory
[ -d $TARGET_DIR ] || mkdir $TARGET_DIR
mv ${SOURCE_DIR}/*.pdf $TARGET_DIR

printf "\nAll done!\n\n"

### eof #####################################################################
