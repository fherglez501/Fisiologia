# Diccionario y origen de los datos

Todos los valores son **simulados** y reproducen los ejemplos de las diapositivas C6.
No son mediciones ni valores de referencia de especies.

## oxigeno_simulado.csv

Siete tiempos de un mismo intervalo hipotético. No son siete animales independientes.

| Columna | Unidad | Definición |
|---|---|---|
| tiempo_min | min | 0 a 60, cada 10 min |
| tiempo_h | h | tiempo_min / 60 |
| sistema_mg_L | mg O₂/L | 8 − 0.30 × tiempo_h; cámara con pez y consumo de fondo |
| blanco_mg_L | mg O₂/L | 8 − 0.05 × tiempo_h; cámara sin pez |

Parámetros: volumen efectivo de agua 2 L; masa 10 g (0.010 kg). Líneas ideales sin ruido;
no se necesita semilla aleatoria. Estos datos no justifican pruebas de significación.

## presupuesto_simulado.csv

Dos escenarios, no dos individuos. `escenario` es texto. Las otras columnas están
en kJ/día: `I_kJ_dia` ingerida, `F_kJ_dia` fecal, `U_kJ_dia` urinaria,
`G_kJ_dia` gases combustibles, `M_kJ_dia` gasto metabólico total,
`P_kJ_dia` producción separada de reservas. F, U, G, M y P permanecen constantes
por decisión del modelo. En animales reales podrían cambiar.

## Tablas generadas en resultados/

- `consumo_oxigeno.csv`: pendientes expresadas como magnitudes de descenso en mg O₂/L/h;
  consumo total en mg O₂/h y específico en mg O₂/kg/h.
- `balance_energetico.csv`: entradas anteriores más `EM_kJ_dia` y `reservas_kJ_dia`.
- `reto.csv`: `reduccion_ingesta` es una proporción sin unidad (0.20 = 20 %);
  `aumento_gasto_kJ_dia` y todas las columnas energéticas están en kJ/día.

Los bloques del cuaderno crean las tablas directamente para hacer visible su origen.
Al repetir la práctica se sobrescriben los CSV generados. Para leer una tabla existente:

```r
oxigeno <- read.csv("datos/oxigeno_simulado.csv", fileEncoding = "UTF-8")
```

Guarda una copia con otro nombre si deseas conservar una variante.
