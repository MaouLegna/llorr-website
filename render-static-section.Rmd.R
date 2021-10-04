rmarkdown::render(
  input = "static/mu.Rmd",
  envir = new.env()
)

rmarkdown::render(
  input = "static/meta.Rmd",
  envir = new.env()
)

rmarkdown::render(
  input = "index.Rmd",
  envir = new.env()
)
