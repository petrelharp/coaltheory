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
XHTMLS = $(patsubst %.tex,$(DISPLAYDIR)/%.xhtml,$(TEXS))

xhtmls :
	make $(XHTMLS)

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

$(DISPLAYDIR)/coaltheory.xml : coaltheory.bib
	latexml --destination=$@ --bibtex $<

$(DISPLAYDIR)/%.html : %.md
	pandoc -c latexmliness/github-markdown.css -f markdown_github -o $@ $<

$(DISPLAYDIR)/%.html : %.tex $(DISPLAYDIR)/coaltheory.xml
	rm -f LaTeXML.cache
	latexmlc --format=html5 --bibliography=$(DISPLAYDIR)/coaltheory.xml --javascript=latexmliness/LaTeXML-maybeMathjax.js --css=latexmliness/plr-style.css --stylesheet=latexmliness/xsl/LaTeXML-all-xhtml.xsl --javascript=latexmliness/adjust-svg.js --destination=$@ $<

# $(DISPLAYDIR)/%.xhtml : %.tex $(DISPLAYDIR)/coaltheory.xml header.tex tailer.tex
# 	$(eval FIGS := $(shell grep includegraphics $*.tex  | sed -e 's/.*\\includegraphics[^{]*{\([^}]*\)\}.*/$(DISPLAYDIR)\/\1.svg/'))
# 	echo 'making $(FIGS)'
# 	if [ '$(FIGS)' ]; then make $(FIGS); fi
# 	latexmlc --format=xhtml --bibliography=$(DISPLAYDIR)/coaltheory.xml --javascript=latexmliness/LaTeXML-maybeMathjax.js --css=latexmliness/plr-style.css --stylesheet=latexmliness/xsl/LaTeXML-all-xhtml.xsl --javascript=latexmliness/adjust-svg.js --destination=$@ $<

$(DISPLAYDIR)/%.xhtml : $(DISPLAYDIR)/%.xml $(DISPLAYDIR)/coaltheory.xml header.tex tailer.tex
	$(eval FIGS := $(shell grep includegraphics $*.tex  | sed -e 's/.*\\includegraphics[^{]*{\([^}]*\)\}.*/$(DISPLAYDIR)\/\1.svg/'))
	echo 'making $(FIGS)'
	if [ '$(FIGS)' ]; then make $(FIGS); fi
	latexmlpost --bibliography=$(DISPLAYDIR)/coaltheory.xml --css=latexmliness/plr-style.css --javascript=latexmliness/LaTeXML-maybeMathjax.js --javascript=latexmliness/adjust-svg.js --stylesheet=latexmliness/xsl/LaTeXML-all-xhtml.xsl --destination=$@ $<

$(DISPLAYDIR)/%.xml : %.tex
	rm -f LaTeXML.cache
	latexml --preamble=header.tex --postamble=tailer.tex --destination=$@ $<

%.svg : %.ink.svg
	inkscape $< --export-plain-svg=$@

$(DISPLAYDIR)/%.svg : %.ink.svg
	inkscape $< --export-plain-svg=$@

%.pdf : %.ink.svg
	inkscape $< --export-pdf=$@

%.svg : %.pdf
	inkscape $< --export-plain-svg=$@

%.png : %.pdf
	convert -density 300 $< -flatten $@
