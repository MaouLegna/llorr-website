data <- sample(x = c(1:10),size = 1000,replace = T)

# path <- file.path("C:","Users","Valentino Vazzoler","Documents","R","llorr-website","static",
#                   glue::glue("test_{Sys.time()}.txt"))
path <- file.path("C:","Users","Valentino Vazzoler","Documents","R","llorr-website","static","test.txt")

write.table(data,file = path)
