source(file.path("C:","LlorR","scripts","lor_main.R" ))
source(file.path("C:","LlorR","scripts","functions","lor_constants.R"))
source(file.path("C:","LlorR","scripts","functions","lor_functions.R"))

update_lor_database(server_abbr = "EU",last_season = "S14",delete = TRUE)
update_lor_database(server_abbr = "NA",last_season = "S14",delete = TRUE)
update_lor_database(server_abbr = "APAC",last_season = "S14",delete = TRUE)

rmarkdown::render(input = file.path("C:","Users","Valentino Vazzoler","Documents","R","llorr-website","static","mu.Rmd"),  output_file = "mu.html",   encoding = 'UTF-8', clean = TRUE)
rmarkdown::render(input = file.path("C:","Users","Valentino Vazzoler","Documents","R","llorr-website","static","meta.Rmd"),output_file = "meta.html", encoding = 'UTF-8', clean = TRUE)
rmarkdown::render_site(encoding = 'UTF-8')

# rmarkdown::render(input = file.path("C:","Users","Valentino Vazzoler","Documents","R","llorr-website","static","mu_temp.Rmd"),  output_file = "mu.html",   encoding = 'UTF-8', clean = TRUE)
# rmarkdown::render(input = file.path("C:","Users","Valentino Vazzoler","Documents","R","llorr-website","static","meta_temp.Rmd"),output_file = "meta.html", encoding = 'UTF-8', clean = TRUE)
# rmarkdown::render('C:/Users/Valentino Vazzoler/Documents/R/llorr-website/_report/meta-report-071/meta-report-071.Rmd',  encoding = 'UTF-8');

#' while (TRUE) {
#' 
#' 
#'   if (!exists("giorno")) {
#'     giorno <- Sys.time() |> lubridate::floor_date("days") + lubridate::hours(4) + lubridate::minutes(0)
#'   }
#' 
#'   message(giorno)
#'   naptime::naptime(giorno)
#' 
#'   #'********************
#'   # Update pages
#'   start   <- Sys.time()
#'   glue::glue("Knit - Start - {start}") |> message()
#'   
#'   source(file.path("C:","LlorR","scripts","lor_main.R" ))
#'   source(file.path("C:","LlorR","scripts","functions","lor_constants.R"))
#'   source(file.path("C:","LlorR","scripts","functions","lor_functions.R"))
#' 
#'   update_lor_database(server_abbr = "EU",last_season = "S13",delete = TRUE)
#'   update_lor_database(server_abbr = "NA",last_season = "S13",delete = TRUE)
#'   update_lor_database(server_abbr = "APAC",last_season = "S13",delete = TRUE)
#' 
#'   rmarkdown::render(input = file.path("C:","Users","Valentino Vazzoler","Documents","R","llorr-website","static","mu.Rmd"), encoding = 'UTF-8')
#'   rmarkdown::render(input = file.path("C:","Users","Valentino Vazzoler","Documents","R","llorr-website","static","meta.Rmd"), encoding = 'UTF-8')
#'   # rmarkdown::render_site(encoding = 'UTF-8')
#' 
#'   end     <- Sys.time()
#'   glue::glue("Knit - End   - {end} / Duration: {round(as.numeric(lubridate::as.duration(end-start), 'seconds'),2)}s") |> message()
#'   beepr::beep("treasure")
#' 
#'   giorno <- Sys.time() |> lubridate::floor_date("days") + lubridate::hours(27)
#' 
#' }

# distill::create_post(
#   title = "THE META REPORT NAME IS TOO LONG, TOO DAMN LONG (n°62)",
#   collection = "report",
#   author = "Valentino (Legna) Vazzoler",
#   slug = "meta-report-072", # seasonal-006
#   date_prefix = NULL,
#   draft = FALSE
# )
# 
# distill::create_post(
#   title = "CI",
#   collection = "analysis",
#   author = "Valentino (Legna) Vazzoler",
#   slug = "ci",
#   date_prefix = NULL,
#   date = Sys.Date(),
#   draft = FALSE
# )

# LoR_Account <- data.table::fread(file.path("C:","LlorR","data","raw",   glue("LoR_ACCOUNT_APAC.csv")), colClasses = "character",header = T, na.strings = c("", NA), encoding = "UTF-8" )
# data.table::fwrite(LoR_Account, file.path("C:","LlorR","data","raw",  glue("LoR_ACCOUNT_APAC.csv") ), quote=TRUE )
