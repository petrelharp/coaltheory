### To set up the gh-pages branch:
# git checkout --orphan gh-pages
# (REMOVE FILES LYING AROUND NOW)
# cp directory-to-gh-pages-stuff/* .
# git add (STUFF JUST ADDED)



.PHONY : publish

publish : 
	git checkout gh-pages
	# update list of files
	git show master:html-these-files.mk > html-these-files.mk
	# make html and xhtml from rules in gh-pages.mk, which exists in the gh-pages branch
	make -f gh-pages.mk publish
	git push origin gh-pages
	git checkout master

clean : 
	-rm -f *.aux *.log *.out *.toc *.nav *.snm *.vrb texput.*

%.pdf : %.tex
	rm -f texput.*
	(cat header.tex; echo '\input{$<}'; echo '\end{document}') | pdflatex
	(cat header.tex; echo '\input{$<}'; echo '\end{document}') | pdflatex
	mv texput.pdf $@
