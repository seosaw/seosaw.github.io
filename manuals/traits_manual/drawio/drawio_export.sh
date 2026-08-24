#!/usr/bin/env sh

gfind . -name '*.drawio' -exec rm -f ../tex/img/{}.pdf \; -exec /Applications/draw.io.app/Contents/MacOS/./draw.io --crop -x -o ../tex/img/{}.pdf {} \;


