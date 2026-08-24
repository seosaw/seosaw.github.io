#!/usr/bin/env sh

drawio() {
	/Applications/draw.io.app/Contents/MacOS/./draw.io --crop -x -o $2 $1 \;
}

rm -r figure/ cache/

mkdir -p ./img/

drawio drawio/subplot.drawio img/subplot.pdf 
drawio drawio/nested.drawio img/nested.pdf 

pdftoppm -png img/subplot.pdf > img/subplot.png
pdftoppm -png img/nested.pdf > img/nested.png

Rscript --verbose -e "require(knitr); knitr::knit('seosaw_dataset_manual.Rnw')"

latexmk -pdf -pdflatex="pdflatex -interaction=nonstopmode" -bibtex seosaw_dataset_manual.tex

latexmk -pdf -pdflatex="pdflatex -interaction=nonstopmode" -bibtex seosaw_dataset_manual.tex

latexmk -c

rm seosaw_dataset_manual.tex

rm -r figure/ cache/
