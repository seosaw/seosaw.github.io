#!/usr/bin/env sh

drawio() {
	/Applications/draw.io.app/Contents/MacOS/./draw.io --crop -x -o $2 $1 \;
}

drawio drawio/plot_bearing.drawio img/plot_bearing.pdf
drawio drawio/catenal.drawio img/catenal.pdf
