# list.files(file.path("C:","Users","Valentino Vazzoler","Documents","R","llorr-website","static"))

if ( Sys.time() > as.POSIXct(format(Sys.Date(), format = "%Y-%m-%d %H:%M:%OS"), tz = "CET") + lubridate::hours(6) &
     Sys.time() < as.POSIXct(format(Sys.Date(), format = "%Y-%m-%d %H:%M:%OS"), tz = "CET") + lubridate::hours(7) ) {

  fwrite(LoR.Account,  file.path("C:","LlorR","data","raw", "LoR_ACCOUNT.csv"  ),quote = TRUE )  
  fwrite(LoR.Deck,     file.path("C:","LlorR","data","raw","LoR_DECK.csv"))
  fwrite(LoR.Match.DT, file.path("C:","LlorR","data","raw", "LoR_MatchDT.csv") )
  fwrite(LoR.Match.DT[, .(match_key, server, status)], file.path("C:","LlorR","data","raw", "LoR_HISTORY.csv") )
  rtweet::write_as_csv(LoR.Twitter, file.path("C:","LlorR","data","raw", "LoR_Twitter.csv" ), prepend_ids = TRUE, na = "", fileEncoding = "UTF-8")
  
  rmarkdown::render(file.path("C:","Users","Valentino Vazzoler","Documents","R","llorr-website","static","mu.Rmd"))
  rmarkdown::render(file.path("C:","Users","Valentino Vazzoler","Documents","R","llorr-website","static","meta.Rmd"))

  rmarkdown::render(file.path("C:","Users","Valentino Vazzoler","Documents","R","llorr-website","index.Rmd"))
  rmarkdown::render_site(
    input = file.path("C:","Users","Valentino Vazzoler","Documents","R","llorr-website"),
    encoding = 'UTF-8')

  # knit_with_parameters("~/R/llorr-website/static/mu.Rmd")

}