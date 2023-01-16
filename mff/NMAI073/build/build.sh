#!/usr/bin/env bash

# /bin/bash

set -ueo pipefail

texdown -c True -m True -i '../edited' -o . -st 3
pdflatex NDMI084.tex -quiet # > 'pdflatex.log'

rm 'NDMI084.aux'
rm 'NDMI084.log'

cp 'NDMI084.pdf' '/Users/cyril/Dropbox/notes/NDMI084.pdf'