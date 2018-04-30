default : index.html dialektyka-oswiecenia.epub dialektyka-oswiecenia.mobi

index.html : chapters/* index.css html.css template.t
	pandoc \
			-s \
			--section-divs \
			-o index.html \
			-c index.css \
			-c html.css \
			--template template.t \
			chapters/*

dialektyka-oswiecenia.epub : chapters/* index.css epub.css template.t cover.jpg
	pandoc \
			-s \
			--section-divs \
			--toc-depth=1 \
			--epub-cover-image cover.jpg \
			-o dialektyka-oswiecenia.epub \
			-c index.css \
			-c epub.css \
			--template template.t \
			chapters/*

dialektyka-oswiecenia.mobi : dialektyka-oswiecenia.epub cover.jpg
	ebook-convert dialektyka-oswiecenia.{epub,mobi} --cover cover.jpg
