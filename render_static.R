while (TRUE) {
  
  if (!exists("giorno")) {
    giorno <- lubridate::floor_date(lubridate::today(),"days") + lubridate::hours(27)
  }
  
  naptime::naptime(giorno)
  
  # Update the decks
  source(file.path("C:","LlorR","scripts","dataIO","lor_deck_v3.R"), encoding = "UTF-8", local = TRUE)
  data.table::fwrite(LoR.Deck, file.path("C:", "LlorR", "data", "raw", "LoR_DECK.csv"))
  
  start <- Sys.time()
  tictoc::tic()
  
  # Update pages
  
  # rmarkdown::render('C:/Users/Valentino Vazzoler/Documents/R/llorr-website/_report/meta-report-046/meta-report-046.Rmd',  encoding = 'UTF-8')
  rmarkdown::render(input = file.path("C:","Users","Valentino Vazzoler","Documents","R","llorr-website","static","mu.Rmd"), encoding = 'UTF-8')
  rmarkdown::render(input = file.path("C:","Users","Valentino Vazzoler","Documents","R","llorr-website","static","meta.Rmd"), encoding = 'UTF-8')
  rmarkdown::render_site(encoding = 'UTF-8')
  
  tictoc::toc()
  end <- Sys.time()
  
  message(start)
  message(end)
  
  giorno <- lubridate::floor_date(lubridate::today(),"days") + lubridate::hours(27)
  
}



