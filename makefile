### To set up the gh-pages branch:
# git checkout --orphan gh-pages
# (REMOVE FILES LYING AROUND NOW)
# cp directory-to-gh-pages-stuff/* .
# git add (STUFF JUST ADDED)

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

.PHONY : clean publish

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
	bibtex texput.aux
	( cat header.tex; echo '\input{$<}'; cat tailer.tex ) | pdflatex
	mv texput.pdf $@

## TO-DO:
# automatically figure out which things to tex up
# remove intermediate .xml and .pdf files

display/introduction.pdf : IBD-sequence-diagram.pdf frequency-spectra-trees.pdf

publish : $(WEBPAGES) clean

# %.md : clean
# 	git show master:$@ > $@
# 
# %.tex : clean
# 	git show master:$@ > $@

%.html : %.md
	pandoc -c github-markdown.css -f markdown_github -o $@ $<

%.html : %.tex
	rm -f LaTeXML.cache
	latexmlc --format=html5 --javascript=LaTeXML-maybeMathjax.js --css=plr-style.css --stylesheet=xsl/LaTeXML-all-xhtml.xsl --javascript=adjust-svg.js --destination=$@ $<

%.xhtml : %.xml
	latexmlpost --css=plr-style.css --javascript=LaTeXML-maybeMathjax.js --javascript=adjust-svg.js --stylesheet=xsl/LaTeXML-all-xhtml.xsl --destination=$@ $<

%.xml : %.tex
	rm -f LaTeXML.cache
	latexml --destination=$@ $<

%.pdf : %.ink.svg
	inkscape $< --export-pdf=$@

%.svg : %.ink.svg
	inkscape $< --export-plain-svg=$@

%.svg : %.pdf
	inkscape $< --export-plain-svg=$@

%.png : %.pdf
	convert -density 300 $< -flatten $@
