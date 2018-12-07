default : index.html ebooks/dialektyka-oswiecenia.mobi

index.html : chapters/* styles/index.css styles/html.css template.t
	pandoc \
			-s \
			--section-divs \
			-o index.html \
			-c styles/index.css \
			-c styles/html.css \
			--template template.t \
			chapters/*

styles/ebook.css : styles/index.css styles/epub.css
	cat styles/index.css > styles/ebook.css && cat styles/epub.css >> styles/ebook.css

ebooks/dialektyka-oswiecenia.epub : chapters/* styles/ebook.css template.t cover.jpg
	pandoc \
			-s \
			--section-divs \
			--toc-depth=2 \
			--epub-cover-image cover.jpg \
			-o ebooks/dialektyka-oswiecenia.epub \
			-c styles/ebook.css \
			--epub-embed-font 'fonts/*' \
			--template template.t \
			-t epub3 \
			chapters/*

ebooks/dialektyka-oswiecenia.mobi : ebooks/dialektyka-oswiecenia.epub
	kindlegen ebooks/dialektyka-oswiecenia.epub
