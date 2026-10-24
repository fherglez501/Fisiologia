# Ejecutar desde la carpeta C6_metabolismo.
# Regenera el script a partir del QMD; R base, sin paquetes adicionales.
lineas <- readLines("C6_metabolismo.qmd", encoding = "UTF-8", warn = FALSE)
inicios <- grep("^```\\{r\\}", lineas)
salida <- c(
  "# C6: Metabolismo y suministro de energía. DATOS SIMULADOS.",
  "# Generado desde C6_metabolismo.qmd con scripts/extraer_codigo.R.",
  "# Abre C6_metabolismo.Rproj. Ejecuta de arriba hacia abajo.",
  "# Las preguntas y explicaciones completas están en el QMD y HTML.",
  "# Al ejecutar este script, las 3 gráficas se guardan en resultados/graficas_C6.pdf.",
  "# Si deseas verlas en Plots, ejecuta solo el código de cada gráfica tras cerrar el PDF.",
  "if (!file.exists('C6_metabolismo.qmd')) {",
  "  stop('Abre C6_metabolismo.Rproj o ejecuta desde la carpeta C6_metabolismo.')",
  "}",
  "dir.create('resultados', showWarnings = FALSE)",
  "# Cairo incrusta las fuentes; pdf() es una alternativa si Cairo no está disponible.",
  "if (capabilities('cairo')) {",
  "  cairo_pdf('resultados/graficas_C6.pdf', width = 8, height = 4.8, onefile = TRUE)",
  "} else {",
  "  pdf('resultados/graficas_C6.pdf', width = 8, height = 4.8)",
  "}",
  ""
)
for (inicio in inicios) {
  final <- which(seq_along(lineas) > inicio & lineas == "```")[1]
  bloque <- lineas[seq.int(inicio + 1, final - 1)]
  etiqueta <- sub("^#\\| label: ", "", bloque[grepl("^#\\| label:", bloque)])
  opcional <- any(grepl("^#\\| eval: false", bloque))
  codigo <- bloque[!grepl("^#\\|", bloque)]
  if (opcional) next
  salida <- c(salida, paste0("# ---- ", etiqueta, " ----"), codigo, "")
}
salida <- c(salida, "dev.off()",
            "writeLines(capture.output(sessionInfo()), 'resultados/sesion_R.txt')",
            "cat('Práctica completa. Consulta resultados/graficas_C6.pdf y los CSV.\\n')",
            "# El complemento opcional sobre temperatura está al final del QMD.")
writeLines(enc2utf8(salida), "C6_metabolismo.R", useBytes = TRUE)
cat("C6_metabolismo.R actualizado desde el cuaderno.\n")
