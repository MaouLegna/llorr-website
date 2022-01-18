rmarkdown::render(input = file.path("C:","Users","Valentino Vazzoler","Documents","R","llorr-website","static","mu.Rmd")  )
rmarkdown::render(input = file.path("C:","Users","Valentino Vazzoler","Documents","R","llorr-website","static","meta.Rmd"))
rmarkdown::render(input = file.path("C:","Users","Valentino Vazzoler","Documents","R","llorr-website","index.Rmd")        )
rmarkdown::render_site(input = file.path("C:","Users","Valentino Vazzoler","Documents","R","llorr-website"),
                       encoding = 'UTF-8')