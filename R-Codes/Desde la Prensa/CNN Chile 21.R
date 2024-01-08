# ---*** R10 CODES ***--- N°63

library(rvest)
library(tidyverse)
library(openxlsx)

base_url <- "https://www.cnnchile.com/search/"
keyword <- "Chile 21"

scrape_page <- function(url) {
  page <- read_html(url)
  
  titles <- page %>%
    html_nodes("h2.inner-item__title") %>%
    html_text()
  
  dates <- page %>%
    html_nodes("p strong") %>%
    html_text()
  
  links <- page %>%
    html_nodes("h2.inner-item__title a") %>%
    html_attr("href")
  
  data.frame(
    Título = titles,
    Fecha_de_publicación = dates,
    Enlace = links
  )
}

total_pages <- 3
all_data <- data.frame()

for (page_number in 1:total_pages) {
  search_url <- paste0(base_url, URLencode(keyword), "/page/", page_number, "/")
  scraped_data <- scrape_page(search_url)
  all_data <- bind_rows(all_data, scraped_data)
}

output_file <- "CNN Chile 21.xlsx"
write.xlsx(all_data, output_file, rowNames = FALSE)
