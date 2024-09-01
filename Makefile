MAIN=how_to_select_latex

zip-paper:
	rm -f how_to_select.zip
	zip -r how_to_select.zip images/ biblio.bib *.bbl how_to_select.tex how_to_select.pdf
	pdftk how_to_select.pdf cat 1-6 output main.pdf
	pdftk how_to_select.pdf cat 7-26 output supplementary_materials.pdf


count: 
	texcount $(MAIN).tex

simple-diff:
	latexdiff original_manuscript.tex  $(MAIN).tex  > diff.tex