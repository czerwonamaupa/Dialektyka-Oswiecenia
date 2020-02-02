default : index.html dialektyka-oswiecenia.mobi

web.css : styles/index.css styles/html.css
	cat styles/index.css > web.css && cat styles/html.css >> web.css

index.html : chapters/* web.css template.t filters/*
	pandoc \
	-s \
	--filter filters/hyphenate.py \
	--section-divs \
	-o index.html \
	-c web.css \
	--template template.t \
	chapters/*

ebook.css : styles/index.css styles/epub.css
	cat styles/index.css > ebook.css && cat styles/epub.css >> ebook.css

dialektyka-oswiecenia.epub : chapters/* ebook.css template.t filters/* cover.jpg
	pandoc \
	-s \
	--filter filters/hyphenate.py \
	--section-divs \
	--toc-depth=2 \
	--epub-cover-image cover.jpg \
	-o dialektyka-oswiecenia.epub \
	-c ebook.css \
	--template template.t \
	-t epub3 \
	chapters/*

dialektyka-oswiecenia.mobi : dialektyka-oswiecenia.epub
	kindlegen dialektyka-oswiecenia.epub

clean :
	$(RM) dialektyka-oswiecenia.epub dialektyka-oswiecenia.mobi index.html web.css ebook.css
