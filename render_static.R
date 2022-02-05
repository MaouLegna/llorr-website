rmarkdown::render(input = file.path("C:","Users","Valentino Vazzoler","Documents","R","llorr-website","static","mu.Rmd"),
                  encoding = 'UTF-8')
rmarkdown::render(input = file.path("C:","Users","Valentino Vazzoler","Documents","R","llorr-website","static","meta.Rmd"),
                  encoding = 'UTF-8')
rmarkdown::render(input = file.path("C:","Users","Valentino Vazzoler","Documents","R","llorr-website","index.Rmd",
                                    encoding = 'UTF-8')        )
rmarkdown::render_site(input = file.path("C:","Users","Valentino Vazzoler","Documents","R","llorr-website"), encoding = 'UTF-8')
# rmarkdown::render_site(encoding = 'UTF-8')