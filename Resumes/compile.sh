#!/bin/bash
# Usage: ./compile.sh <path/to/file.tex>
# Compiles a LaTeX resume, removes auxiliary files, and opens the PDF.

set -e

if [ -z "$1" ]; then
    echo "Usage: $0 <path/to/file.tex>"
    exit 1
fi

TEX=$(realpath "$1")
DIR=$(dirname "$TEX")
BASE=$(basename "$TEX" .tex)

cd "$DIR"

pdflatex -interaction=nonstopmode "$BASE.tex"
pdflatex -interaction=nonstopmode "$BASE.tex"

rm -f "$BASE.aux" "$BASE.log" "$BASE.out" "$BASE.fls" "$BASE.fdb_latexmk" "$BASE.synctex.gz" "$BASE.toc"

open "$BASE.pdf"
