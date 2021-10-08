rmarkdown::render("static/mu.Rmd", "html_document")
rmarkdown::render("static/meta.Rmd", "html_document")
rmarkdown::render_site(encoding = 'UTF-8')
