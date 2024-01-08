# ---*** R10 CODES ***--- N°68

library(rvest)
library(tidyverse)
library(openxlsx)

extract_data <- function(url) {
  page <- read_html(url)
  
  titulos <- page %>% 
    html_nodes("h4.d-tag-card__title") %>% 
    html_text() %>% 
    trimws()
  
  fechas <- page %>% 
    html_nodes("time.d-tag-card__date") %>% 
    html_attr("datetime")
  
  enlaces <- page %>% 
    html_nodes("a.d-tag-card__permalink") %>% 
    html_attr("href")
  
  resultados_pagina <- data.frame(
    Titulo = titulos,
    Fecha = fechas,
    Enlace = enlaces
  )
  
  return(resultados_pagina)
}

palabra_clave <- "Nodo XXI"
base_url <- "https://www.elmostrador.cl/search/"
num_paginas <- 2  

resultados_totales <- data.frame()
for (pagina in 1:num_paginas) {
  url <- paste0(base_url, URLencode(palabra_clave), "/page/", pagina, "/")
  resultados_pagina <- extract_data(url)
  resultados_totales <- bind_rows(resultados_totales, resultados_pagina)
}

xlsx_file <- "El Mostrador Nodo XXI.xlsx"
write.xlsx(resultados_totales, xlsx_file, row.names = FALSE)

cat("¡Web scraping completado! Resultados guardados en", xlsx_file)
