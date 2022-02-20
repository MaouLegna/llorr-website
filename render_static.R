naptime::naptime( lubridate::as_datetime( lubridate::today(tzone = "CET")+lubridate::days(1),tz = "CET") )

source(file.path("C:","LlorR","scripts","dataIO","lor_deck_v3.R"))
data.table::fwrite(LoR.Deck, file.path("C:", "LlorR", "data", "raw", "LoR_DECK.csv"))
# rmarkdown::render('C:/Users/Valentino Vazzoler/Documents/R/llorr-website/_report/meta-report-046/meta-report-046.Rmd',  encoding = 'UTF-8')

tictoc::tic()

rmarkdown::render(input = file.path("C:","Users","Valentino Vazzoler","Documents","R","llorr-website","static","mu.Rmd"), encoding = 'UTF-8')
rmarkdown::render(input = file.path("C:","Users","Valentino Vazzoler","Documents","R","llorr-website","static","meta.Rmd"), encoding = 'UTF-8')
rmarkdown::render_site(encoding = 'UTF-8')

tictoc::toc()
Sys.time()
