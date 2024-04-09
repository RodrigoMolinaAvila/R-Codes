import pandas as pd

file_path = 'C:\\Users\\rodri\\OneDrive\\Escritorio\\Clasificación\\Automate 2.xlsx'
news_data = pd.read_excel(file_path)

news_data['Título'] = news_data['Título'].str.lower()

palabras_clave_politica = [
    "política", "gobierno", "elecciones", "partido", "democracia", "político", "estado", 
    "ministerio", "ley", "reforma", "congreso", "senado", "diputado", "alcaldía", 
    "municipalidad", "boric", "libertad", "liberalismo", "bachelet", "piñera", 
    "derecha", "presidente", "frente", "república", "populismo", "izquierda", 
    "acuerdo", "progresismo", "cambio", "chilenos", "desafío", "nacional", "ciudad", 
    "transición", "debate", "gabinete", "gobernadores", "sentido", "riesgo", "informe", 
    "ciudadana", "vida", "pública", "juego", "realidad", "pensar", "legado", "centro", 
    "horas", "gente", "progreso", "acceso", "fundación", "contra", "réplica", "chileno", 
    "américa", "presidencial", "elección", "primarias", "pc", "ac", "propuesta", 
    "populista", "aylwin", "tc", "voto", "jiles", "votar", "brexit", "venezuela", 
    "electoral", "liberales", "proceso", "democrática", "cultura", "pacto", "sistema", 
    "socialismo", "poder", "autoridad", "institucional", "rey", "triunfo", "lagos", 
    "allende", "liberal", "votan", "comunistas", "chávez", "bolsonaro", "democráticos", 
    "dc", "gobernar", "demócratas", "jak", "ominami", "pueblo", "conflicto", "elegir", "guerra"
]

palabras_clave_justicia = [
    "justicia", "tribunal", "juez", "derecho", "sentencia", "legal", "jurídico", "demanda", 
    "abogado", "fiscal", "litigio", "corte", "suprema", "reconciliación", "evidencia", 
    "verdad", "antecedentes", "legitimidad", "civil", "seguridad", "crimen", "orden", 
    "sename"
]
palabras_clave_economia = [
    "economía", "finanzas", "mercado", "comercio", "empresa", "negocio", "financiero", 
    "inversión", "crisis", "crecimiento", "macroeconomía", "moneda", "banco", "bolsa", 
    "salario", "trabajo", "imacec", "ipom", "modelo", "retorno", "económico", "proyecto", 
    "deuda", "ipc", "rescate", "asalariados", "impacto", "libre", "precio", "sueldo", 
    "confianza", "financiamiento", "tasa", "trimestre", "balance", "cifras", "datos", 
    "desempleo", "costos", "smith", "lucro", "eficiencia", "dinamismo", "piketty", 
    "briones", "reconstrucción", "empleo", "empleos", "optimismo", "chicago", "capital", 
    "friedman", "control", "casen", "economista", "capitalismo", "desarrollo", "trabajadores"
]

palabras_clave_desigualdad = [
    "desigualdad", "inequidad", "brecha", "disparidad", "desbalance", "exclusión", 
    "marginación", "ilusión", "clase", "desigual"
]

palabras_clave_impuestos = [
    "impuesto", "tributo", "fiscalidad", "recaudación", "iva", "impuesto de renta", 
    "tributario", "hacienda", "tributaria"
]

palabras_clave_pobreza = [
    "pobreza", "pobre", "miseria", "indigencia", "necesidad", "carencia", 
    "subsistencia", "vulnerabilidad"
]

palabras_clave_salud = [
    "salud", "enfermedad", "médico", "hospital", "sanidad", "clínica", "paciente", 
    "tratamiento", "epidemia", "prevención", "vacuna", "salubridad", "coronavirus", 
    "eutanasia", "pandemia", "cuarentenas", "covid", "cuidado"
]
palabras_clave_previsión = [
    "previsión", "seguridad social", "jubilación", "pensión", "retiro", "providencia", 
    "seguro", "beneficio", "afp", "fondo de pensiones", "pensiones"
]

palabras_clave_medio_ambiente = [
    "medio ambiente", "ecología", "contaminación", "sostenible", "clima", 
    "recursos naturales", "biodiversidad", "conservación", "parque natural", 
    "reserva ecológica", "agua"
]

palabras_clave_corrupcion = [
    "corrupción", "soborno", "cohecho", "fraude", "ilegalidad", "malversación", 
    "desfalco", "transparencia", "licitación"
]

palabras_clave_reforma_estado = [
    "reforma de estado", "modernización del estado", "gobierno abierto", 
    "transparencia gubernamental", "administración pública", "servicio civil", 
    "instituciones", "modernidad"
]

palabras_clave_subsidiariedad = [
    "subsidiariedad", "autonomía local", "descentralización", "autogobierno", 
    "federalismo", "municipalismo", "solidaridad", "autonomía", "descentralizar"
]

palabras_clave_migracion = [
    "migración", "inmigrante", "emigrante", "migrante", "refugiado", "asilo", 
    "desplazamiento", "frontera", "extranjería"
]

palabras_clave_genero = [
    "género", "mujer", "feminismo", "igualdad de género", "lgbtq", "diversidad sexual", 
    "identidad de género", "violencia de género", "aborto", "homosexual", 
    "matrimonio igualitario", "familias", "familia", "matrimonio", "diversidad", 
    "paridad", "adopción", "identidad"
]

palabras_clave_constitucion = [
    "constitución", "constituyente", "carta magna", "reforma constitucional", 
    "derecho constitucional", "plebiscito", "convención", "rechazo", "constitucional", 
    "apruebo"
]

palabras_clave_temas_indigenas = [
    "indígena", "pueblo originario", "etnia", "comunidad nativa", "derechos indígenas", 
    "tierras ancestrales", "autodeterminación", "araucanía", "plurinacionalidad"
]

palabras_clave_derechos_humanos = [
    "derechos humanos", "ddhh", "derecho internacional", "crímenes de lesa humanidad", 
    "amnistía", "libertad de expresión"
]

palabras_clave_dictadura = [
    "dictadura", "régimen autoritario", "golpe de estado", "represión", "censura", 
    "militar", "junta", "tiranía"
]

palabras_clave_movimientos_sociales = [
    "movimiento social", "protesta", "activismo", "movilización", "reivindicación",
    "octubrismo", "revolución", "manifestación", "fe", "social", "sociedad",
    "dios", "cristianismo", "alma", "sindicato"
]

palabras_clave_protestas = [
    "protesta", "manifestación", "marcha", "paro", "huelga", "confrontación", 
    "bloqueo", "octubre", "dignidad", "estallido", "fuego"
]

palabras_clave_educacion = [
    "universidad", "auditorio", "superior", "calidad", "clases", "gratuidad", "cae", 
    "niños", "esfuerzo", "universidades", "escolar", "docente", "padres", "director", 
    "simce", "colegios", "educar", "admisión", "carrera"
]


def clasificar_titulo(titulo):
    if not isinstance(titulo, str):
        return "Otros"

    categorias = []

    for palabra in palabras_clave_politica:
        if palabra in titulo:
            categorias.append("Política")
            break

    for palabra in palabras_clave_justicia:
        if palabra in titulo:
            categorias.append("Justicia")
            break

    for palabra in palabras_clave_economia:
        if palabra in titulo:
            categorias.append("Economía")
            break

    for palabra in palabras_clave_desigualdad:
        if palabra in titulo:
            categorias.append("Desigualdad")
            break

    for palabra in palabras_clave_impuestos:
        if palabra in titulo:
            categorias.append("Impuestos")
            break

    for palabra in palabras_clave_pobreza:
        if palabra in titulo:
            categorias.append("Pobreza")
            break

    for palabra in palabras_clave_salud:
        if palabra in titulo:
            categorias.append("Salud")
            break

    for palabra in palabras_clave_previsión:
        if palabra in titulo:
            categorias.append("Previsión")
            break

    for palabra in palabras_clave_medio_ambiente:
        if palabra in titulo:
            categorias.append("Medio Ambiente")
            break

    for palabra in palabras_clave_corrupcion:
        if palabra in titulo:
            categorias.append("Corrupción")
            break

    for palabra in palabras_clave_reforma_estado:
        if palabra in titulo:
            categorias.append("Reforma de Estado")
            break

    for palabra in palabras_clave_subsidiariedad:
        if palabra in titulo:
            categorias.append("Subsidiariedad")
            break

    for palabra in palabras_clave_migracion:
        if palabra in titulo:
            categorias.append("Migración")
            break

    for palabra in palabras_clave_genero:
        if palabra in titulo:
            categorias.append("Género")
            break

    for palabra in palabras_clave_constitucion:
        if palabra in titulo:
            categorias.append("Constitución")
            break

    for palabra in palabras_clave_temas_indigenas:
        if palabra in titulo:
            categorias.append("Temas Indígenas")
            break

    for palabra in palabras_clave_derechos_humanos:
        if palabra in titulo:
            categorias.append("Derechos Humanos")
            break

    for palabra in palabras_clave_dictadura:
        if palabra in titulo:
            categorias.append("Dictadura")
            break

    for palabra in palabras_clave_movimientos_sociales:
        if palabra in titulo:
            categorias.append("Movimientos Sociales")
            break

    for palabra in palabras_clave_protestas:
        if palabra in titulo:
            categorias.append("Protestas")
            break

    for palabra in palabras_clave_educacion:
        if palabra in titulo:
            categorias.append("Educación")
            break


    return ", ".join(categorias) if categorias else "Otros"

news_data['Categoría'] = news_data['Título'].apply(clasificar_titulo)


output_file_path = 'C:\\(directorios de tu pc)\Noticias Clasificadas.xlsx'
news_data.to_excel(output_file_path, index=False)
