# rmarkdown::render_site( )

# rmarkdown::render(
#   input = "static/meta.Rmd",
#   envir = new.env()
# )

rmarkdown::render("static/mu.Rmd", "html_document", envir = new.env())
rmarkdown::render("static/meta.Rmd", "html_document", envir = new.env())