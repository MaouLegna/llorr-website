while (TRUE) {
  
  
  if (!exists("giorno")) {
    giorno <- Sys.time() |> lubridate::floor_date("days") + lubridate::hours(25) + lubridate::minutes(30)
  }
  
  message(giorno)
  naptime::naptime(giorno)
  
  #'********************
  # Update the decks
  start   <- Sys.time()
  glue::glue("Deck - Start - {start}") |> message()
  
  # Read Decks
  LoR.Deck    <- data.table::fread(file.path("C:","LlorR","data","raw","LoR_DECK.csv"),header = T,na.strings = c("",NA) )
  source(file.path("C:","LlorR","scripts","dataIO","lor_deck_v3.R"), encoding = "UTF-8", local = TRUE)
  # LoR.Deck.RMD <- LoR.Deck
  data.table::fwrite(LoR.Deck, file.path("C:", "LlorR", "data", "raw", "LoR_DECK.csv"))
  
  
  end     <- Sys.time()
  glue::glue("Deck - End   - {end} / Duration: {round(as.numeric(lubridate::as.duration(end-start), 'seconds'),2)}s") |> message()
  
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
  
  
  giorno <- Sys.time() |> lubridate::floor_date("days") + lubridate::hours(27)
  
}



# OlsonNames()

# distill::create_post(
#   "THE META REPORT NAME IS TOO LONG, TOO DAMN LONG (n°XX)",
#   collection = "report",
#   author = "Valentino (Legna) Vazzoler",
#   slug = "meta-report-060",
#   date = "2021-05-11",
#   date_prefix = NULL,
#   draft = TRUE,
#   edit = interactive()
# )
# 
# distill::create_post(
#   "THE SEASONAL REPORT IS VAST (n°XXX)",
#   collection = "report",
#   author = "Valentino (Legna) Vazzoler",
#   slug = "seasonal-005",
#   date = "2022-05-14",
#   date_prefix = NULL,
#   draft = FALSE,
#   edit = interactive()
# )
