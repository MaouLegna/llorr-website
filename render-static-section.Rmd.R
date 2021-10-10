rmarkdown::render("static/mu.Rmd")
rmarkdown::render("static/meta.Rmd")

# rmarkdown::render("static/meta.Rmd", "html_document")
# knit_with_parameters("~/R/llorr-website/static/mu.Rmd")
# knit_with_parameters("~/R/llorr-website/static/meta.Rmd")

rmarkdown::render_site(encoding = 'UTF-8')


