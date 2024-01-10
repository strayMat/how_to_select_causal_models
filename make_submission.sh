#! /bin/bash
rm -f how_to_select_causal_models.zip
zip -r how_to_select_causal_models.zip images/ biblio.bib *.bbl how_to_select_causal_models.tex 
pdftk how_to_select_causal_models.pdf cat 1-24 output main.pdf
pdftk how_to_select_causal_models.pdf cat 25-49 output supplementary_materials.pdf