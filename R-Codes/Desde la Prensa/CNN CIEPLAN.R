# ---*** R10 CODES ***--- N°64

library(rvest)
library(tidyverse)
library(openxlsx)

keyword <- "CIEPLAN"
base_url <- "https://www.cnnchile.com/search/"
search_url <- paste0(base_url, URLencode(keyword))

page <- read_html(search_url)

titles <- page %>%
  html_nodes("h2.inner-item__title") %>%
  html_text()

dates <- page %>%
  html_nodes("p strong") %>%
  html_text()

links <- page %>%
  html_nodes("h2.inner-item__title a") %>%
  html_attr("href")

data <- data.frame(
  Título = titles,
  Fecha_de_publicación = dates,
  Enlace = links
)

output_file <- "CNN Search - CIEPLAN.xlsx"
write.xlsx(data, output_file, rowNames = FALSE)
