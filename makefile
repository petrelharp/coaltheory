.PHONY : publish


publish : 
	git checkout gh-pages
	make gh-pages
	git push origin gh-pages
	git checkout master
