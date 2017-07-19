system('rm _main.Rmd || true')
bookdown::render_book('index.Rmd','bookdown::gitbook')
system('(cd ~/_book/ && caddy)')
