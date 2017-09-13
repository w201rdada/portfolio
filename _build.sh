#!/bin/bash
pkill caddy
cd /home/oski/ && rm -rf _book/ _main*md \
&& Rscript -e 'bookdown::render_book("index.Rmd", "bookdown::gitbook")' \
&& cd /home/oski/_book && caddy
