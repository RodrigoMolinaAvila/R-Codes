# ---*** R10 CODES ***--- N°69

library(rvest)
library(tidyverse)
library(openxlsx)

enlaces <- c(
  "https://www.bcn.cl/historiapolitica/proceso_constitucional/consejo_constitucional/ficha/Alihuén_Antileo_Navarrete",
  "https://www.bcn.cl/historiapolitica/proceso_constitucional/consejo_constitucional/ficha/Karen_Araya_Rojas",
  "https://www.bcn.cl/historiapolitica/proceso_constitucional/consejo_constitucional/ficha/Marcela_Araya_Sepúlveda",
  "https://www.bcn.cl/historiapolitica/proceso_constitucional/consejo_constitucional/ficha/Antonio_Barchiesi_Chávez",
  "https://www.bcn.cl/historiapolitica/proceso_constitucional/consejo_constitucional/ficha/Germán_Becker",
  "https://www.bcn.cl/historiapolitica/proceso_constitucional/consejo_constitucional/ficha/Jessica_Bengoa_Mayorga",
  "https://www.bcn.cl/historiapolitica/proceso_constitucional/consejo_constitucional/ficha/Pilar_Cuevas_Mardones",
  "https://www.bcn.cl/historiapolitica/proceso_constitucional/consejo_constitucional/ficha/Jorge_De_La_Maza_Schleyer",
  "https://www.bcn.cl/historiapolitica/proceso_constitucional/consejo_constitucional/ficha/Edmundo_Eluchans",
  "https://www.bcn.cl/historiapolitica/proceso_constitucional/consejo_constitucional/ficha/Sebastián_Figueroa_Melo",
  "https://www.bcn.cl/historiapolitica/proceso_constitucional/consejo_constitucional/ficha/Mariela_Fincheira_Massardo",
  "https://www.bcn.cl/historiapolitica/proceso_constitucional/consejo_constitucional/ficha/Lorena_Gallardo_Cárdenas",
  "https://www.bcn.cl/historiapolitica/proceso_constitucional/consejo_constitucional/ficha/María_Gatica_Gajardo",
  "https://www.bcn.cl/historiapolitica/proceso_constitucional/consejo_constitucional/ficha/José_González_Pizarro",
  "https://www.bcn.cl/historiapolitica/proceso_constitucional/consejo_constitucional/ficha/Ivón_Guerra_Aguilera",
  "https://www.bcn.cl/historiapolitica/proceso_constitucional/consejo_constitucional/ficha/Beatriz_Hevia_Willer",
  "https://www.bcn.cl/historiapolitica/proceso_constitucional/consejo_constitucional/ficha/Gloria_Hutt_Hesse",
  "https://www.bcn.cl/historiapolitica/proceso_constitucional/consejo_constitucional/ficha/María_Claudia_Jorquera_Coria",
  "https://www.bcn.cl/historiapolitica/proceso_constitucional/consejo_constitucional/ficha/Alejandro_Köhler_Vargas",
  "https://www.bcn.cl/historiapolitica/proceso_constitucional/consejo_constitucional/ficha/Miguel_Littin_Cucumides",
  "https://www.bcn.cl/historiapolitica/proceso_constitucional/consejo_constitucional/ficha/Yerko_Ljubetic_Godoy",
  "https://www.bcn.cl/historiapolitica/proceso_constitucional/consejo_constitucional/ficha/María_de_los_Ángeles_López_Porfiri",
  "https://www.bcn.cl/historiapolitica/proceso_constitucional/consejo_constitucional/ficha/Claudia_Mac-Lean_Bravo",
  "https://www.bcn.cl/historiapolitica/proceso_constitucional/consejo_constitucional/ficha/Ivonne_Mangelsdorff_Galeb",
  "https://www.bcn.cl/historiapolitica/proceso_constitucional/consejo_constitucional/ficha/Nancy_Márquez_González",
  "https://www.bcn.cl/historiapolitica/proceso_constitucional/consejo_constitucional/ficha/Cecilia_Medina_Meneses",
  "https://www.bcn.cl/historiapolitica/proceso_constitucional/consejo_constitucional/ficha/Kinturay_Melín_Rapimán",
  "https://www.bcn.cl/historiapolitica/proceso_constitucional/consejo_constitucional/ficha/Carmen_Montoya_Mayorga",
  "https://www.bcn.cl/historiapolitica/proceso_constitucional/consejo_constitucional/ficha/Julio_Ñanco_Antilef",
  "https://www.bcn.cl/historiapolitica/proceso_constitucional/consejo_constitucional/ficha/Carolina_Navarrete_Rubio",
  "https://www.bcn.cl/historiapolitica/proceso_constitucional/consejo_constitucional/ficha/Jocelyn_Ormeño_Lee",
  "https://www.bcn.cl/historiapolitica/proceso_constitucional/consejo_constitucional/ficha/Ricardo_Ortega_Perrier",
  "https://www.bcn.cl/historiapolitica/proceso_constitucional/consejo_constitucional/ficha/Jorge_Ossandón_Spoerer",
  "https://www.bcn.cl/historiapolitica/proceso_constitucional/consejo_constitucional/ficha/María_Pardo_Vergara",
  "https://www.bcn.cl/historiapolitica/proceso_constitucional/consejo_constitucional/ficha/Gloria_Paredes_Díaz",
  "https://www.bcn.cl/historiapolitica/proceso_constitucional/consejo_constitucional/ficha/Sebastián_Parraguez_González",
  "https://www.bcn.cl/historiapolitica/proceso_constitucional/consejo_constitucional/ficha/Ninoska_Payauna_Vilca",
  "https://www.bcn.cl/historiapolitica/proceso_constitucional/consejo_constitucional/ficha/Arturo_Phillips_Dorr",
  "https://www.bcn.cl/historiapolitica/proceso_constitucional/consejo_constitucional/ficha/Carlos_Recondo",
  "https://www.bcn.cl/historiapolitica/proceso_constitucional/consejo_constitucional/ficha/Miguel_Rojas_Soto",
  "https://www.bcn.cl/historiapolitica/proceso_constitucional/consejo_constitucional/ficha/Aldo_Sanhueza_Carrera",
  "https://www.bcn.cl/historiapolitica/proceso_constitucional/consejo_constitucional/ficha/Paul_Sfeir_Rubio",
  "https://www.bcn.cl/historiapolitica/proceso_constitucional/consejo_constitucional/ficha/Luis_Silva_Irarrázaval",
  "https://www.bcn.cl/historiapolitica/proceso_constitucional/consejo_constitucional/ficha/Carlos_Solar_Barrios",
  "https://www.bcn.cl/historiapolitica/proceso_constitucional/consejo_constitucional/ficha/Patricia_Spoerer_Price",
  "https://www.bcn.cl/historiapolitica/proceso_constitucional/consejo_constitucional/ficha/Christian_Suárez_Crothers",
  "https://www.bcn.cl/historiapolitica/proceso_constitucional/consejo_constitucional/ficha/Héctor_Urban_Astete",
  "https://www.bcn.cl/historiapolitica/proceso_constitucional/consejo_constitucional/ficha/Aldo_Valle_Acevedo",
  "https://www.bcn.cl/historiapolitica/proceso_constitucional/consejo_constitucional/ficha/Diego_Vargas_Castillo",
  "https://www.bcn.cl/historiapolitica/proceso_constitucional/consejo_constitucional/ficha/Fernando_Viveros_Reyes",
  "https://www.bcn.cl/historiapolitica/proceso_constitucional/consejo_constitucional/ficha/Paloma_Zúñiga_Cerda"
)

extraer_datos <- function(url) {
  pagina_individual <- read_html(url)
  
  nombre <- pagina_individual %>%
    html_node("h2.text-periodo.seleccionRS") %>%
    html_text(trim = TRUE)
  
  cat("Procesando:", nombre, "\n")
  
  fecha_nacimiento <- pagina_individual %>%
    html_node("span[property='bio:date']") %>%
    html_text(trim = TRUE)
  
  ciudad_nacimiento <- pagina_individual %>%
    html_node("span[property='bio:place']") %>%
    html_text(trim = TRUE)
  
  partido_politico <- pagina_individual %>%
    html_node("span[typeof='bcnbio:PoliticalParty'] a") %>%
    html_text(trim = TRUE)
  
  lugar_representa <- pagina_individual %>%
    html_node("span[property='bcnbio:representingPlaceNamed']") %>%
    html_text(trim = TRUE)
  
  grado_academico <- pagina_individual %>%
    html_node("span[property='bcnbio:profession']") %>%
    html_text(trim = TRUE)
  
  data.frame(
    Nombre = nombre,
    Fecha_Nacimiento = fecha_nacimiento,
    Ciudad_Nacimiento = ciudad_nacimiento,
    Grado_Academico = grado_academico,
    Partido_Politico = partido_politico,
    Lugar_Representacion = lugar_representa,
    URL = url,
    stringsAsFactors = FALSE
  )
}

datos_adicionales <- map_dfr(enlaces, extraer_datos)

datos_adicionales <- datos_adicionales %>%
  select(Nombre, Fecha_Nacimiento, Ciudad_Nacimiento, Grado_Academico, Partido_Politico, Lugar_Representacion, URL)

write.xlsx(datos_adicionales, "Consejeros Constitucionales 2023.xlsx", rowNames = FALSE)
