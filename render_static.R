source(file.path("C:","LlorR","scripts","lor_main.R" ))
source(file.path("C:","LlorR","scripts","functions","lor_constants.R"))
source(file.path("C:","LlorR","scripts","functions","lor_functions.R"))

# update_lor_database(server_abbr = "EU",last_season = "S16",delete = TRUE)
# update_lor_database(server_abbr = "NA",last_season = "S16",delete = TRUE)
# update_lor_database(server_abbr = "APAC",last_season = "S16",delete = TRUE)
update_lor_database(server_abbr = "EU",last_season = "S16",delete = TRUE, status=TRUE)
update_lor_database(server_abbr = "NA",last_season = "S16",delete = TRUE, status=TRUE)
update_lor_database(server_abbr = "APAC",last_season = "S16",delete = TRUE, status=TRUE)

# rmarkdown::render('C:/Users/Valentino Vazzoler/Documents/R/llorr-website/static/mu.Rmd',  encoding = 'UTF-8');
# rmarkdown::render('C:/Users/Valentino Vazzoler/Documents/R/llorr-website/static/meta.Rmd',  encoding = 'UTF-8');

rmarkdown::render(input = file.path("C:","Users","Valentino Vazzoler","Documents","R","llorr-website","static","meta_temp.Rmd"),output_file = "meta.html", encoding = 'UTF-8', clean = TRUE)
rmarkdown::render(input = file.path("C:","Users","Valentino Vazzoler","Documents","R","llorr-website","static","mu_temp.Rmd"),  output_file = "mu.html",   encoding = 'UTF-8', clean = TRUE)

# git add -A && git commit -m "update 2022-10-25 06:47"
# git push -u origin master
# git push

distill::create_post(
  title = "THE META REPORT NAME IS TOO LONG, TOO DAMN LONG (n°80)",
  collection = "report",
  author = "Valentino (Legna) Vazzoler",
  slug = "meta-report-081",
  # slug = "seasonal-s15",
  date_prefix = NULL,
  draft = FALSE
)

# distill::create_post(
#   title = "CI",
#   collection = "analysis",
#   author = "Valentino (Legna) Vazzoler",
#   slug = "ci",
#   date_prefix = NULL,
#   date = Sys.Date(),
#   draft = FALSE
# )

