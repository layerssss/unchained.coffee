all: unchained.js

publish: gh-pages build 

gh-pages: node_modules unchained.js
	rm -Rf docs
	node_modules/.bin/docco *.litcoffee
	cp -R examples docs/examples
	cp unchained.js docs/
	cd docs \
		&& git init \
		&& mv unchained.html index.html\
		&& git add -A \
		&& git commit -m 'compiled by [docco](http://jashkenas.github.io/docco/)' \
		&& git remote add origin git@github.com:layerssss/unchained.coffee.git 
	- cd docs && git push -f origin master:gh-pages
	rm -Rf docs

unchained.js: unchained.litcoffee node_modules
	node_modules/.bin/coffee --compile unchained.litcoffee

build: node_modules unchained.js
	rm -Rf build
	mkdir build
	
	cp unchained.litcoffee build/README.md
	cp unchained.js build/unchained.js
	cp -R examples build/examples
	cd build \
		&& git init \
		&& git add -A \
		&& git commit -m 'compiled at $(shell date)' \
		&& git remote add origin git@github.com:layerssss/unchained.coffee.git 
	- cd build && git push -f origin master
	rm -Rf build


node_modules: package.json
	npm install
	touch $@
.PHONY: gh-pages build publish