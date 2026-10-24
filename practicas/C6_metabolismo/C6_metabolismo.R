# C6: Metabolismo y suministro de energía. DATOS SIMULADOS.
# Generado desde C6_metabolismo.qmd con scripts/extraer_codigo.R.
# Abre C6_metabolismo.Rproj. Ejecuta de arriba hacia abajo.
# Las preguntas y explicaciones completas están en el QMD y HTML.
# Al ejecutar este script, las 3 gráficas se guardan en resultados/graficas_C6.pdf.
# Si deseas verlas en Plots, ejecuta solo el código de cada gráfica tras cerrar el PDF.
if (!file.exists('C6_metabolismo.qmd')) {
  stop('Abre C6_metabolismo.Rproj o ejecuta desde la carpeta C6_metabolismo.')
}
dir.create('resultados', showWarnings = FALSE)
# Cairo incrusta las fuentes; pdf() es una alternativa si Cairo no está disponible.
if (capabilities('cairo')) {
  cairo_pdf('resultados/graficas_C6.pdf', width = 8, height = 4.8, onefile = TRUE)
} else {
  pdf('resultados/graficas_C6.pdf', width = 8, height = 4.8)
}

# ---- preparacion ----
# Crea las carpetas de salida si todavía no existen.
dir.create("datos", showWarnings = FALSE)
dir.create("resultados", showWarnings = FALSE)
options(width = 90)

# Una primera operación: pasar de gramos a kilogramos.
masa_g <- 10
masa_kg <- masa_g / 1000
print(masa_kg)

# ---- datos-oxigeno ----
# seq() produce 0, 10, 20, ..., 60 minutos.
tiempo_min <- seq(0, 60, by = 10)
tiempo_h <- tiempo_min / 60

# Disminuciones SIMULADAS: sistema 0.30 y blanco 0.05 mg O2/L/h.
# data.frame() organiza las columnas en una tabla.
oxigeno <- data.frame(
  tiempo_min = tiempo_min,
  tiempo_h = tiempo_h,
  sistema_mg_L = 8 - 0.30 * tiempo_h,
  blanco_mg_L = 8 - 0.05 * tiempo_h
)
print(oxigeno)

# Exporta los mismos datos que acabas de crear.
write.csv(oxigeno, "datos/oxigeno_simulado.csv", row.names = FALSE)

# ---- fig-oxigeno ----
# type = "b" dibuja puntos y líneas. Las formas también distinguen series.
plot(oxigeno$tiempo_min, oxigeno$sistema_mg_L,
     type = "b", pch = 16, col = "#147D92", lwd = 2,
     ylim = range(oxigeno$sistema_mg_L, oxigeno$blanco_mg_L),
     xlab = "Tiempo (min)", ylab = "Concentración de O2 (mg/L)",
     main = "Oxígeno en la cámara: ejemplo simulado")
lines(oxigeno$tiempo_min, oxigeno$blanco_mg_L,
      type = "b", pch = 17, col = "#B65C24", lty = 2, lwd = 2)
legend("bottomleft", c("Sistema con pez", "Blanco sin pez"),
       col = c("#147D92", "#B65C24"), pch = c(16, 17),
       lty = c(1, 2), lwd = 2, bty = "n")

# ---- tasa-oxigeno ----
# Ajusta concentración en función del tiempo medido en horas.
modelo_sistema <- lm(sistema_mg_L ~ tiempo_h, data = oxigeno)
modelo_blanco <- lm(blanco_mg_L ~ tiempo_h, data = oxigeno)

# Las pendientes son negativas. El signo menos las convierte en descensos positivos.
descenso_sistema <- -unname(coef(modelo_sistema)[2])
descenso_blanco <- -unname(coef(modelo_blanco)[2])

volumen_efectivo_L <- 2
masa_g <- 10
masa_kg <- masa_g / 1000

# (mg O2/L/h) * L = mg O2/h atribuibles al animal.
consumo_total_mg_h <- (descenso_sistema - descenso_blanco) * volumen_efectivo_L

# (mg O2/h) / kg = mg O2/kg/h.
consumo_especifico_mg_kg_h <- consumo_total_mg_h / masa_kg

resultado_oxigeno <- data.frame(
  descenso_sistema_mg_L_h = descenso_sistema,
  descenso_blanco_mg_L_h = descenso_blanco,
  consumo_total_mg_h = consumo_total_mg_h,
  consumo_especifico_mg_kg_h = consumo_especifico_mg_kg_h
)
print(round(resultado_oxigeno, 3))
write.csv(resultado_oxigeno, "resultados/consumo_oxigeno.csv", row.names = FALSE)

# ---- presupuesto ----
# Cada fila representa un escenario didáctico, no un animal muestreado.
presupuesto <- data.frame(
  escenario = c("Inicial", "Menor ingestión"),
  I_kJ_dia = c(300, 240),
  F_kJ_dia = c(60, 60),
  U_kJ_dia = c(15, 15),
  G_kJ_dia = c(0, 0),
  M_kJ_dia = c(180, 180),
  P_kJ_dia = c(20, 20)
)

# Guarda las entradas antes de añadir resultados.
write.csv(presupuesto, "datos/presupuesto_simulado.csv", row.names = FALSE,
          fileEncoding = "UTF-8")

# $ permite usar una columna y crear otra con los resultados de cada fila.
presupuesto$EM_kJ_dia <- presupuesto$I_kJ_dia - presupuesto$F_kJ_dia -
  presupuesto$U_kJ_dia - presupuesto$G_kJ_dia
presupuesto$reservas_kJ_dia <- presupuesto$EM_kJ_dia -
  presupuesto$M_kJ_dia - presupuesto$P_kJ_dia
print(presupuesto)
write.csv(presupuesto, "resultados/balance_energetico.csv", row.names = FALSE,
          fileEncoding = "UTF-8")

# ---- fig-reservas ----
# Incluye siempre el cero: permite comparar acumulación y movilización.
limites <- range(c(0, presupuesto$reservas_kJ_dia)) + c(-15, 15)
barras <- barplot(presupuesto$reservas_kJ_dia,
                  names.arg = presupuesto$escenario,
                  col = c("#147D92", "#B65C24"), border = NA,
                  ylim = limites, ylab = "Cambio de reservas (kJ/día)",
                  main = "Menor ingestión cambia el balance")
abline(h = 0, lwd = 2)
text(barras, presupuesto$reservas_kJ_dia,
     labels = paste(presupuesto$reservas_kJ_dia, "kJ/día"),
     pos = ifelse(presupuesto$reservas_kJ_dia >= 0, 3, 1))

# ---- reto ----
# CAMBIA AQUÍ: proporción de reducción de ingestión (0.20 significa 20 %).
reduccion_ingesta <- 0.20
# CAMBIA AQUÍ: incremento del gasto en kJ/día, NO en porcentaje.
aumento_gasto_kJ_dia <- 30

# Comprueba que las entradas representen este escenario.
stopifnot(reduccion_ingesta >= 0, reduccion_ingesta <= 1,
          aumento_gasto_kJ_dia >= 0)

I_reto <- 300 * (1 - reduccion_ingesta)
M_reto <- 180 + aumento_gasto_kJ_dia
EM_reto <- I_reto - 60 - 15 - 0
reservas_reto <- EM_reto - M_reto - 20

resultado_reto <- data.frame(
  reduccion_ingesta = reduccion_ingesta,
  aumento_gasto_kJ_dia = aumento_gasto_kJ_dia,
  I_kJ_dia = I_reto, M_kJ_dia = M_reto,
  EM_kJ_dia = EM_reto, reservas_kJ_dia = reservas_reto
)
print(resultado_reto)
write.csv(resultado_reto, "resultados/reto.csv", row.names = FALSE)

# ---- fig-reto ----
valores_reto <- c(presupuesto$reservas_kJ_dia, reservas_reto)
barras_reto <- barplot(valores_reto,
  names.arg = c("Inicial", "Menor ingestión", "Ingestión + actividad"),
  col = c("#147D92", "#B65C24", "#7D4B91"), border = NA,
  ylim = range(c(0, valores_reto)) + c(-20, 20),
  ylab = "Cambio de reservas (kJ/día)",
  main = "Entrada y gasto actúan sobre las reservas")
abline(h = 0, lwd = 2)
text(barras_reto, valores_reto, labels = paste(valores_reto, "kJ/día"),
     pos = ifelse(valores_reto >= 0, 3, 1))

dev.off()
writeLines(capture.output(sessionInfo()), 'resultados/sesion_R.txt')
cat('Práctica completa. Consulta resultados/graficas_C6.pdf y los CSV.\n')
# El complemento opcional sobre temperatura está al final del QMD.
