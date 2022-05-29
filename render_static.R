source(file.path("C:","LlorR","scripts","lor_main.R" ))
source(file.path("C:","LlorR","scripts","functions","lor_constants.R"))
source(file.path("C:","LlorR","scripts","functions","lor_functions.R"))

# new_decks <- c(
#   list.files(path = file.path("C:", "LlorR", "data", "raw"), pattern = glue("^(.*)Temp_(.*)csv$"), full.names = T)
#   # list.files(path = file.path("C:", "LlorR", "data", "raw"), pattern = glue("^(.*)Seasonal(.*)csv$"), full.names = T)
# ) |>
#   map_dfr(data.table::fread, select = c("game_type","game_mode","deck_code_1","deck_code_2","factions_1","factions_2"), header =T, colClasses = "character")

while (TRUE) {
  
  
  if (!exists("giorno")) {
    giorno <- Sys.time() |> lubridate::floor_date("days") + lubridate::hours(6) + lubridate::minutes(30)
  }
  
  message(giorno)
  naptime::naptime(giorno)
  
  #'********************
  # Update pages
  start   <- Sys.time()
  glue::glue("Knit - Start - {start}") |> message()
  
  # rmarkdown::render('C:/Users/Valentino Vazzoler/Documents/R/llorr-website/_report/meta-report-046/meta-report-046.Rmd',  encoding = 'UTF-8')
  rmarkdown::render(input = file.path("C:","Users","Valentino Vazzoler","Documents","R","llorr-website","static","mu.Rmd"), encoding = 'UTF-8')
  rmarkdown::render(input = file.path("C:","Users","Valentino Vazzoler","Documents","R","llorr-website","static","meta.Rmd"), encoding = 'UTF-8')
  rmarkdown::render_site(encoding = 'UTF-8')
  # ==> rmarkdown::render_site(encoding = 'UTF-8')
  
  end     <- Sys.time()
  glue::glue("Knit - End   - {end} / Duration: {round(as.numeric(lubridate::as.duration(end-start), 'seconds'),2)}s") |> message()
  beepr::beep("treasure")
  
  giorno <- Sys.time() |> lubridate::floor_date("days") + lubridate::hours(27)
  
}
