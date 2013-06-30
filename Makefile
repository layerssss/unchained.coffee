all: unchained.js

%.publish: %
	cd  $^ \
		&& git init \
		&& git add -A \
		&& git commit -m 'compiled automatically' \
		&& git remote add origin git@github.com:layerssss/unchained.coffee.git 
	- cd  $^ && git push -f origin master:$^

EXAMPLES = $(shell find examples)

gh-pages: $(EXAMPLES) unchained.coffee markem.conf/layout.jade README.md
	markem --out $@
	cp -R $^ $@
	touch $@
	
%.html: %.jade
	jade < $^ > $@

unchained.js: unchained.coffee node_modules
	node_modules/.bin/coffee --compile unchained.coffee

node_modules: package.json
	npm install
	touch $@
.PHONY: 