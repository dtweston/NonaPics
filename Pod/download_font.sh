#!/bin/bash

DEST="Pod/Assets"

if [ ! -d "$DEST" ]; then
  mkdir "$DEST"
fi
cd "$DEST"

curl -L -O -# https://github.com/github/octicons/raw/master/octicons/octicons.ttf
