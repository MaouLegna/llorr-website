while (TRUE) {
  
  
  if (!exists("giorno")) {
    giorno <- Sys.time() |> lubridate::floor_date("days") + lubridate::hours(27)
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

# LoR.Account    <- data.table::fread(file.path("C:","LlorR","data","raw",glue("LoR_ACCOUNT_EU.csv")),
#                                     colClasses = "character",header = T, na.strings = c("", NA), encoding = "UTF-8")
# 
# Current.Master.Info <- data.table::fread(file.path("C:","LlorR","data","raw","account",glue("LoR_Master_S12_EU.csv")),
#                                          header = T, na.strings = c("", NA), encoding = "UTF-8")
# 
# LeaderBoard <- data.table::fread(file.path("C:","LlorR","data","raw","account", glue("LoR_Leaderboard_DT_S12_EU.csv") ) )
# 
# Current.Master.by.Lead <- 
#   LeaderBoard |>
#   group_by(name) |>
#   slice_min(time,n=1,with_ties = F) 
# 
# lor_leaderboard_dupe("europe")
# 
# Base <- tibble(
#   gameName = lor_leaderboard("europe",names = T)
# )
# 
# Current.Master.Info.v2 <- Base |>
#   left_join(
#     Current.Master.Info |>
#       mutate(time = as_datetime(time)) |>
#       group_by(gameName) |>
#       slice_min(time,n=1,with_ties = F),
#     by = "gameName"
#   )
# 
# Current.Master.by.Lead |>
#   select(name,leadtime = time) |>
#   left_join(Current.Master.Info.v2 |>
#               select(name=gameName,time), by = "name") |>
#   filter(leadtime > time)

# source(file.path("C:","LlorR","scripts","lor_main.R" ))
# source(file.path("C:","LlorR","scripts","functions","lor_constants.R"))
# source(file.path("C:","LlorR","scripts","functions","lor_functions.R"))

Test.Deck <- data.table::fread(file.path("C:","LlorR","data","raw","LoR_DECK.csv"),header = T,na.strings = c("",NA),nrows = 10000 )

Test.Deck |>
  filter(str_count(champs,",")==2) -> Test.Deck

str_extract_all(Test.Deck$cards[1], pattern = paste(LoR.Champion$cardCode, collapse = "|") )



Test.Deck |>
  mutate(
    champs        = as.list(str_extract_all(cards, pattern = paste(LoR.Champion$cardCode, collapse = "|"))[[1]])
  )
    


# turn champs into proper string
champs = str_flatten( sort( str_replace_all( unique(champs) , set_names(LoR.Champion$name, LoR.Champion$cardCode))) , collapse = ",")
    
