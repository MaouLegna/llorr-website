# list.files(file.path("C:","Users","Valentino Vazzoler","Documents","R","llorr-website","static"))

if ( Sys.time() > as.POSIXct(format(Sys.Date(), format = "%Y-%m-%d %H:%M:%OS"), tz = "CET") + lubridate::hours(6) &
     Sys.time() < as.POSIXct(format(Sys.Date(), format = "%Y-%m-%d %H:%M:%OS"), tz = "CET") + lubridate::hours(7) ) {

  rmarkdown::render(file.path("C:","Users","Valentino Vazzoler","Documents","R","llorr-website","static","mu.Rmd"))
  rmarkdown::render(file.path("C:","Users","Valentino Vazzoler","Documents","R","llorr-website","static","meta.Rmd"))

  rmarkdown::render(file.path("C:","Users","Valentino Vazzoler","Documents","R","llorr-website","index.Rmd"))
  rmarkdown::render_site(
    input = file.path("C:","Users","Valentino Vazzoler","Documents","R","llorr-website"),
    encoding = 'UTF-8')

  # knit_with_parameters("~/R/llorr-website/static/mu.Rmd")

}