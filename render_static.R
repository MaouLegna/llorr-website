source(file.path("C:","LlorR","scripts","lor_main.R" ))
source(file.path("C:","LlorR","scripts","functions","lor_constants.R"))
source(file.path("C:","LlorR","scripts","functions","lor_functions.R"))

while (TRUE) {
  
  
  if (!exists("giorno")) {
    giorno <- Sys.time() |> lubridate::floor_date("days") + lubridate::hours(4) + lubridate::minutes(30)
  }
  
  message(giorno)
  naptime::naptime(giorno)
  
  #'********************
  # Update pages
  start   <- Sys.time()
  glue::glue("Knit - Start - {start}") |> message()
  
  update_lor_database(server_abbr = "EU",last_season = "S13",delete = TRUE)
  update_lor_database(server_abbr = "NA",last_season = "S13",delete = TRUE)
  update_lor_database(server_abbr = "APAC",last_season = "S13",delete = TRUE)
  
  rmarkdown::render(input = file.path("C:","Users","Valentino Vazzoler","Documents","R","llorr-website","static","mu.Rmd"), encoding = 'UTF-8')
  rmarkdown::render(input = file.path("C:","Users","Valentino Vazzoler","Documents","R","llorr-website","static","meta.Rmd"), encoding = 'UTF-8')
  rmarkdown::render_site(encoding = 'UTF-8')
  
  end     <- Sys.time()
  glue::glue("Knit - End   - {end} / Duration: {round(as.numeric(lubridate::as.duration(end-start), 'seconds'),2)}s") |> message()
  beepr::beep("treasure")
  
  giorno <- Sys.time() |> lubridate::floor_date("days") + lubridate::hours(27)
  
}
