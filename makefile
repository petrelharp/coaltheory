### To set up the gh-pages branch:
# git checkout --orphan gh-pages
# (REMOVE FILES LYING AROUND NOW)
# cp directory-to-gh-pages-stuff/* .
# git add (STUFF JUST ADDED)
#
#

.PHONY : clean publish pdfs

###
# names of files you want made and published to github (in gh-pages) should be in html-these-files.mk
# which lives in the master branch and is automatically pushed over
include html-these-files.mk

MD_HTML = $(patsubst %.md,%.html,$(MDS))
TEX_HTML = $(patsubst %.tex,%.html,$(TEXS))
TEX_XHTML = $(patsubst %.tex,%.xhtml,$(TEXS))
WEBPAGES = $(MD_HTML) $(TEX_HTML) $(TEX_XHTML)
# put pdfs, htmls, in this directory
DISPLAYDIR = display

PDFS = $(patsubst %.tex,$(DISPLAYDIR)/%.pdf,$(TEXS))

pdfs :
	make $(PDFS)


# publish web pages to gh-pages
publish : 
	git checkout gh-pages
	# update list of files
	git show master:html-these-files.mk > html-these-files.mk
	# make html and xhtml
	make publish
	git push origin gh-pages
	git checkout master

clean : 
	-rm -f *.aux *.log *.bbl *.blg *.out *.toc *.nav *.snm *.vrb texput.*
	rm -f LaTeXML.cache


# make pdfs locally
$(DISPLAYDIR)/%.pdf : %.tex
	rm -f texput.*
	( cat header.tex; echo '\input{$<}'; cat tailer.tex ) | pdflatex
	-bibtex texput
	( cat header.tex; echo '\input{$<}'; cat tailer.tex ) | pdflatex
	( cat header.tex; echo '\input{$<}'; cat tailer.tex ) | pdflatex
	mv texput.pdf $@

## TO-DO:
# automatically figure out which things to tex up
# remove intermediate .xml and .pdf files

$(DISPLAYDIR)/introduction.pdf : pedigree-ibd-recombination.pdf

$(DISPLAYDIR)/segmenting-the-genome.pdf : IBD-sequence-diagram.pdf

$(DISPLAYDIR)/summary-stats.pdf : frequency-spectra-trees.pdf coal-time-correlation.pdf

publish : $(WEBPAGES) clean

# %.md : clean
# 	git show master:$@ > $@
# 
# %.tex : clean
# 	git show master:$@ > $@

$(DISPLAYDIR)/%.html : %.md
	pandoc -c github-markdown.css -f markdown_github -o $@ $<

$(DISPLAYDIR)/%.html : %.tex
	rm -f LaTeXML.cache
	( cat header.tex; echo '\input{$<}'; cat tailer.tex ) | latexmlc --format=html5 --javascript=LaTeXML-maybeMathjax.js --css=plr-style.css --stylesheet=xsl/LaTeXML-all-xhtml.xsl --javascript=adjust-svg.js --destination=$@ -

$(DISPLAYDIR)/%.xhtml : $(DISPLAYDIR)/%.xml
	latexmlpost --css=plr-style.css --javascript=LaTeXML-maybeMathjax.js --javascript=adjust-svg.js --stylesheet=xsl/LaTeXML-all-xhtml.xsl --destination=$@ $<

$(DISPLAYDIR)/%.xml : %.tex
	rm -f LaTeXML.cache
	( cat header.tex; echo '\input{$<}'; cat tailer.tex ) | latexml --destination=$@ -

%.pdf : %.ink.svg
	inkscape $< --export-pdf=$@

%.svg : %.ink.svg
	inkscape $< --export-plain-svg=$@

%.svg : %.pdf
	inkscape $< --export-plain-svg=$@

%.png : %.pdf
	convert -density 300 $< -flatten $@
