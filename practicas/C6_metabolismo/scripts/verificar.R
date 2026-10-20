# Ejecuta desde C6_metabolismo. Verifica los parámetros originales de la entrega.
# Si cambias deliberadamente los escenarios, sus resultados serán diferentes.
entorno <- new.env(parent = globalenv())
source("C6_metabolismo.R", local = entorno, encoding = "UTF-8")
iguales <- function(obtenido, esperado) {
  isTRUE(all.equal(unname(obtenido), esperado, tolerance = 1e-8))
}
stopifnot(
  nrow(entorno$oxigeno) == 7,
  iguales(entorno$descenso_sistema, 0.30),
  iguales(entorno$descenso_blanco, 0.05),
  iguales(entorno$consumo_total_mg_h, 0.50),
  iguales(entorno$consumo_especifico_mg_kg_h, 50),
  iguales(entorno$presupuesto$EM_kJ_dia, c(225, 165)),
  iguales(entorno$presupuesto$reservas_kJ_dia, c(25, -35)),
  iguales(entorno$reservas_reto, -65),
  # Comprobación de conservación: entradas = pérdidas + gasto + producción + reservas.
  iguales(with(entorno$presupuesto,
    F_kJ_dia + U_kJ_dia + G_kJ_dia + M_kJ_dia + P_kJ_dia + reservas_kJ_dia),
    c(300, 240))
)
# Confirma que las tablas de entrega conservan los resultados y las unidades en nombres.
leido <- read.csv("resultados/consumo_oxigeno.csv")
stopifnot(iguales(leido$consumo_total_mg_h, 0.50),
          file.info("resultados/graficas_C6.pdf")$size > 1000)
cat("Verificación aprobada: pendientes, unidades, balance, reto y exportación.\n")
