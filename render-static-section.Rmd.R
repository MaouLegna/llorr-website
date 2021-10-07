# rmarkdown::render("static/mu.Rmd", "html_document")
rmarkdown::render("static/mu.Rmd", envir = new.env())
# rmarkdown::render("static/meta.Rmd", "html_document")
rmarkdown::render("static/meta.Rmd", envir = new.env())

rmarkdown::render_site(encoding = 'UTF-8')
