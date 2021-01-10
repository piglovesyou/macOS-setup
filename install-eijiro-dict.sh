#!/usr/bin/env bash
#title          eijiro-setup.sh
#description    This script deploys downloaded zip/rar files of  "英辞郎 Ver.158 for macOS Dictionary.app" into your ~/Library/Dictionaries
#author         soichi
#date           2019-08-06
#version        1.0.0
#usage          bash eijiro-setup.sh
#notes          Befor run
#                 1. go https://www.tecorin.com/osx/index.html and buy it (expect Ver.158)
#                 2. download all six files you bought and leave them in your ~/Downloads
#==============================================================================

set -e
start=`date +%s`

DICTIONARY_DIR=~/Library/Dictionaries
SOURCE_DIR=~/Downloads

EXPECTED_SOURCES=" \
    Eijiro.dictionary.zip \
    Reijiro.dictionary.zip \
    TEXT.zip \
    Waeijiro.dictionary.part1.rar \
    Waeijiro.dictionary.part2.rar \
    Waeijiro.dictionary.part3.rar"

echo "...Checking zip/rar existence"
for SOURCE in $EXPECTED_SOURCES ; do
    if [ ! -f "$SOURCE_DIR/$SOURCE" ]; then
        echo "$SOURCE_DIR/$SOURCE doesn't exist"
        echo "exit 1"
        exit 1
    fi
done

echo "...Checking dependencies"
if ! hash unrar 2>/dev/null; then brew install unrar ; fi

echo "...Removing existing dictionary data"
rm -rf $DICTIONARY_DIR/__MACOSX
rm -rf $DICTIONARY_DIR/Eijiro.dictionary
rm -rf $DICTIONARY_DIR/Reijiro.dictionary
rm -rf $DICTIONARY_DIR/Waeijiro.dictionary
rm -rf $DICTIONARY_DIR/TEXT

echo "...Extracting data from $SOURCE_DIR"
unzip $SOURCE_DIR/Eijiro.dictionary.zip -d $DICTIONARY_DIR
unzip $SOURCE_DIR/Reijiro.dictionary.zip -d $DICTIONARY_DIR
unzip $SOURCE_DIR/TEXT.zip -d $DICTIONARY_DIR

find $SOURCE_DIR -name 'Waeijiro.dictionary.part*.rar' -exec unrar -pSECRET -y -ad x {} $SOURCE_DIR \;
unzip $SOURCE_DIR/Waeijiro.dictionary.part1/Waeijiro.dictionary.zip -d $DICTIONARY_DIR

rm -rf $DICTIONARY_DIR/__MACOSX

end=`date +%s`
runtime=$((end-start))

echo ""
echo "✨ Done in $runtime seconds"
