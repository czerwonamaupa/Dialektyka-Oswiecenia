default : index.html dialektyka-oswiecenia.epub dialektyka-oswiecenia.mobi

index.html : chapters/* index.css template.t
	pandoc \
			-s \
			--section-divs \
			-o index.html \
			-c index.css \
			--template template.t \
			chapters/*

dialektyka-oswiecenia.epub : chapters/* index.css template.t cover.png
	pandoc \
			-s \
			--section-divs \
			--toc-depth=1 \
			--epub-cover-image cover.png \
			-o dialektyka-oswiecenia.epub \
			-c index.css \
			--template template.t \
			chapters/*

dialektyka-oswiecenia.mobi : dialektyka-oswiecenia.epub cover.png
	ebook-convert dialektyka-oswiecenia.{epub,mobi} --cover cover.png
