while (TRUE) {
  
  
  if (!exists("giorno")) {
    giorno <- Sys.time() |> lubridate::floor_date("days") + lubridate::hours(25) + lubridate::minutes(30)
  }
  
  message(giorno)
  naptime::naptime(giorno)
  
  # Update the decks
  
  source(file.path("C:","LlorR","scripts","dataIO","lor_deck_v3.R"), encoding = "UTF-8", local = TRUE)
  data.table::fwrite(LoR.Deck, file.path("C:", "LlorR", "data", "raw", "LoR_DECK.csv"))
  
  start   <- Sys.time()
  glue::glue("Knit - Start - {start}") |> message()
  
  # Update pages
  
  # rmarkdown::render('C:/Users/Valentino Vazzoler/Documents/R/llorr-website/_report/meta-report-046/meta-report-046.Rmd',  encoding = 'UTF-8')
  rmarkdown::render(input = file.path("C:","Users","Valentino Vazzoler","Documents","R","llorr-website","static","mu.Rmd"), encoding = 'UTF-8')
  rmarkdown::render(input = file.path("C:","Users","Valentino Vazzoler","Documents","R","llorr-website","static","meta.Rmd"), encoding = 'UTF-8')
  rmarkdown::render_site(encoding = 'UTF-8')
  
  end     <- Sys.time()
  glue::glue("Knit - End   - {end} / Duration: {round(as.numeric(lubridate::as.duration(end-start), 'seconds'),2)}s") |> message()
  
  giorno <- Sys.time() |> lubridate::floor_date("days") + lubridate::hours(27)
  
}



# source(file.path("C:","LlorR","scripts","lor_main.R" ))
# source(file.path("C:","LlorR","scripts","functions","lor_constants.R"))
# source(file.path("C:","LlorR","scripts","functions","lor_functions.R"))


champs_pretty_label <-  function(cards) {
  
  # cards <- Test.Deck$cards[10]
  # extract the vector of champion cards
  cards <- str_extract_all(cards, pattern = paste(LoR.Champion$cardCode, collapse = "|") ) |> extract2(1)
  
  length(cards)
  
  # we are interested in cases with at least 3 different champion
  # if the length of the vector is 4 or less (1,1,1) or (2,1,1)
  # in this case maybe it's more appropriate to still consider as a 6 cards - 2,2,2 scenario
  
}

LoR.Deck |>
  mutate(count = str_count(champs,",") ) |>
  mutate(l = map_dbl(cards,champs_pretty_label)) -> Test.Deck_v3

Test.Deck_v3 |>
  gtsummary::tbl_cross(count,l) -> gt_cross

readr::write_rds(Test.Deck_v3 |> select(l,count),file.path("C:", "LlorR", "data", "temp", "champion_count.rds"))

# str_extract_all(Test.Deck$cards[1], pattern = paste(LoR.Champion$cardCode, collapse = "|") ) |> extract2(1) |> table() |> . => sprintf("%s: %s",.,names(.)) 
  
  
  # tabyl() |> rename_with(~c("card","n","freq"))

