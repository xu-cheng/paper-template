# vim: set filetype=perl:

do "../paper/.latexmkrc";

# use lualatex
$pdflatex = 'lualatex --synctex=1 --file-line-error %O %S';
