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

SOURCE_DIR="pdf"
TARGET_DIR="pdfa"
PDFA_VERSION="2"

printf "\nConverting all pdf files to pdf/a-$PDFA_VERSION"
printf "\n===================================\n\n"

# apt-get install unoconv
UNOCONV=$(which unoconv)
if [ -z $UNOCONV ]; then
  printf "ERROR: Cannot find unoconv, please install it first.\n\n"
  exit 1
fi

# build a list of all pdf documents to convert
LIST=$(ls ${SOURCE_DIR}/*.pdf)
if [ -z "$LIST" ]; then
  printf "ERROR: Cannot find any documents to convert.\n\n"
  exit 1
fi

# create target dir if it doesn't exist
[ -d $TARGET_DIR ] || mkdir $TARGET_DIR

# needed to change this, otherwise we would override the original pdf file

# the main process
for FILE in $LIST; do
  printf " * Working on: $FILE\n"
  unoconv -f pdf -eSelectPdfVersion=$PDFA_VERSION -o $TARGET_DIR/$FILE $FILE
done

# move all converted documents to a separate directory
#[ -d $RESULTS_DIR ] || mkdir $RESULTS_DIR
#mv *.pdf $RESULTS_DIR

printf "\nAll done!\n\n"

### eof #####################################################################
