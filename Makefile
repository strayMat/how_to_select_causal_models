MAIN=how_to_select_latex

zip-paper:
	rm -f how_to_select.zip
	zip -r how_to_select.zip images/ biblio.bib *.bbl how_to_select_latex.tex how_to_select_latex.pdf
	pdftk how_to_select_latex.pdf cat 1-7 output main.pdf
	pdftk how_to_select_latex.pdf cat 8-29 output supplementary_materials.pdf


count: 
	texcount $(MAIN).tex

simple-diff:
	latexdiff original_manuscript.tex  $(MAIN).tex  > diff.tex

# Create main pdf for additional files 
additional_files_submission:
	pdftk how_to_select_latex.pdf cat 8-29 output additional_files_submission.pdf
