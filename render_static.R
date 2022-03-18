naptime::naptime( lubridate::as_datetime( lubridate::today(tzone = "CET")+lubridate::days(1),tz = "CET") )

source(file.path("C:","LlorR","scripts","dataIO","lor_deck_v3.R"))
data.table::fwrite(LoR.Deck, file.path("C:", "LlorR", "data", "raw", "LoR_DECK.csv"))

# rmarkdown::render('C:/Users/Valentino Vazzoler/Documents/R/llorr-website/_report/meta-report-046/meta-report-046.Rmd',  encoding = 'UTF-8')
start <- Sys.time()
tictoc::tic()

rmarkdown::render(input = file.path("C:","Users","Valentino Vazzoler","Documents","R","llorr-website","static","mu.Rmd"), encoding = 'UTF-8')
rmarkdown::render(input = file.path("C:","Users","Valentino Vazzoler","Documents","R","llorr-website","static","meta.Rmd"), encoding = 'UTF-8')
rmarkdown::render_site(encoding = 'UTF-8')

tictoc::toc()
end <- Sys.time()

start
end


# -------------------------------------------------------------------------

# distill::create_post(
#   "THE META REPORT NAME IS TOO LONG, TOO DAMN LONG (n°XX)",
#   collection = "report",
#   author = "Valentino (Legna) Vazzoler",
#   slug = "meta-report-050",
#   date = "2021-12-31",
#   date_prefix = NULL,
#   draft = TRUE,
#   edit = interactive()
# )
# 
# "Patch 3.2 - Week 2 - Meta Report
# ~18k Matches or ~36k Master Games
# ~78k Matches or ~156k HighDiamond Games
# 
# Master:
#   EU: 119 / NA: 131 / APAC: 123
# ~HighDiamond: 1191"
