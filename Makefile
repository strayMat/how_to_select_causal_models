zip-paper:
	rm -f how_to_select.zip
	zip -r how_to_select.zip images/ biblio.bib *.bbl how_to_select.tex how_to_select.pdf
	pdftk how_to_select.pdf cat 1-6 output main.pdf
	pdftk how_to_select.pdf cat 7-26 output supplementary_materials.pdf
