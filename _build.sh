#!/bin/bash
pkill caddy
cd /home/rstudio/ && rm -rf _book/ _main*md \
&& Rscript -e 'bookdown::render_book("index.Rmd", "bookdown::gitbook")' \
&& cd /home/rstudio/_book && caddy
