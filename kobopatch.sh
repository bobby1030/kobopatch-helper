#!/usr/bin/env bash

HARDWARE=$1
TARGETVER=$2
HARDWAREREV=$(echo $HARDWARE | sed -e "s/kobo//")
DATE=$(curl -o- https://raw.githubusercontent.com/pgaskin/KoboStuff/gh-pages/kfw.db.js | grep $TARGETVER | grep -oP "$HARDWAREREV/\K(\D{3}\d{4})" | head -n 1)

if [ -z $1 ] | [ -z $2 ]
then
	echo "Hardware revision and/or target firmware version not provided."
	exit 1
fi

# Build folder structure
mkdir -p patches/$TARGETVER cache output/$TARGETVER/stock output/$TARGETVER/patch
if [ "$?" -ne 0 ]
then
	echo "Failed making directories. /patches & /cache might already exist?"
fi

# Get latest kobopatch for corresponding firmware
wget "https://github.com/pgaskin/kobopatch-patches/releases/latest/download/kobopatch_$TARGETVER.zip" -O cache/kobopatch_$TARGETVER.zip
unzip -o cache/kobopatch_$TARGETVER.zip -d patches/$TARGETVER/

# Get stock firmware
wget "https://kbdownload1-a.akamaihd.net/firmwares/$HARDWARE/$DATE/kobo-update-$TARGETVER.zip" -O patches/$TARGETVER/src/kobo-update-$TARGETVER.zip
unzip -o patches/$TARGETVER/src/kobo-update-$TARGETVER.zip KoboRoot.tgz -d output/$TARGETVER/stock

# Overwrite kobopatch.yaml with template
cp patches/$TARGETVER/kobopatch.yaml patches/$TARGETVER/kobopatch.yaml.bak
cat kobopatch.yaml | sed -e "s/{{TARGETVER}}/$TARGETVER/" > patches/$TARGETVER/kobopatch.yaml

# Patch the stock firmware
patches/$TARGETVER/kobopatch.sh

# Copy patched firmware to output folder
cp patches/$TARGETVER/out/KoboRoot.tgz output/$TARGETVER/patch
