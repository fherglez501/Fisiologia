# C6 · Guía docente y respuestas orientativas

**Uso:** preparar y retroalimentar una práctica de 100 minutos para licenciatura.
El cuaderno cubre principalmente C6, secciones 6.5–6.6; recupera ATP y respiración
aeróbica de 6.1–6.4. No sustituye toda la exposición del capítulo.

## Preparación y conducción

1. Proyecta `C6_metabolismo.html`. Solicita que las parejas abran el `.Rproj` de C6.
2. Dedica 10 minutos a una asignación, una operación y una predicción. Comprueba que todos distinguen g y kg.
3. En los siguientes 30 minutos, guía el ejemplo del pez. Pide señalar concentración, pendiente y tasa total en tres lugares diferentes.
4. Dedica 35 minutos al presupuesto. Antes de mostrar resultados, solicita EM y ΔE con calculadora.
5. Usa 15 minutos para cambiar parámetros: una persona predice y la otra ejecuta; luego intercambian funciones.
6. Cierra en 10 minutos con la pregunta de ATP y una limitación del modelo. El complemento de temperatura añade 10 minutos y puede omitirse.

Si el grupo es completamente nuevo en R, reparte la práctica en dos sesiones de 50 minutos.
No se requiere instalar tidyverse. El script funciona con R base; el HTML se lee sin instalar software.
La evaluación propuesta es formativa. No se asignan fechas, porcentajes ni nuevas ponderaciones del curso.

## Matriz de alineación

| Resultado al final de la sesión | Contenido | Actividad | Evidencia | Instrumento | Criterio | Tiempo | Fuente |
|---|---|---|---|---|---|---|---|
| Ejecutar una asignación y predecir un cambio | R básico y energía | Preparación | Predicción y masa en kg | Observación | Distingue dato y unidad | 10 min | QMD |
| Calcular tasa corregida total y específica | Respirometría | Ejercicio 1 | Tabla, gráfica, respuestas 1–2 | Lista de cotejo | Blanco y conversión g/kg correctos | 30 min | C6, diapos. 22–26 |
| Resolver EM y ΔE y explicar el signo | Presupuesto | Ejercicio 2 | Tabla, gráfica, respuestas 3–4 | Lista de cotejo | Conserva energía sin doble conteo | 35 min | C6, diapos. 32–36 |
| Comparar dos variantes e indicar límites | Perturbación y gasto | Reto | Parámetros, gráfica y respuestas 5–6 | Lista de cotejo | Conecta mecanismo, supuesto y evidencia | 15 min | C6, diapos. 37–39 |
| Relacionar recambio de ATP con tasa | Integración | Cierre individual | Dos frases y predicción revisada | Retroalimentación oral | Distingue concentración de flujo | 10 min | C6, diapos. 2, 40–41 |

## Respuestas orientativas

**1. Blanco.** Sin corregir: 2 × 0.30 = **0.60 mg O₂/h**. Sobreestimación:
0.60 − 0.50 = **0.10 mg O₂/h**, equivalente a **20 % del valor corregido**
(0.10 / 0.50 × 100). El blanco representa consumo del sistema y no debe asignarse al pez.

**2. Masa.** Con 20 g y las mismas pendientes, el consumo total sigue en
**0.50 mg O₂/h**; el específico pasa a **25 mg O₂/kg/h**. Solo cambió el
 denominador. No se midió otro pez ni se estimó un exponente alométrico.

**3. Presupuesto.** Inicial: EM = **225 kJ/día**, ΔE = **+25 kJ/día**.
Menor ingestión: EM = **165 kJ/día**, ΔE = **−35 kJ/día**. La ingestión
continúa positiva; la energía metabolizable resulta insuficiente para M + P.
La reserva cubre la diferencia bajo los supuestos del modelo.

**4. Equilibrio.** I = F + U + G + M + P = **275 kJ/día**.
Comprobación: `275 - 60 - 15 - 0 - 180 - 20` devuelve 0.
No es una recomendación nutricional de una especie.

**5. Reto.**

| Reducción | Aumento de M | I | M | EM | ΔE | Cambio de ΔE respecto a +25 |
|---|---:|---:|---:|---:|---:|---:|
| 20 % | 30 | 240 | 210 | 165 | −65 | −90 |
| 10 % | 10 | 270 | 190 | 195 | −15 | −40 |

Todos los valores energéticos están en kJ/día. En el primer reto, la reducción
de entrada de 60 y el aumento del gasto de 30 explican el descenso total de 90.
En el segundo son 30 y 10. Valorar el mecanismo y el denominador, no solo el número.

**6. Aplicación.** Son aceptables respuestas justificadas: aumentar forrajeo con
posible exposición a depredadores; reducir actividad con menor oportunidad de
alimentación; reducir inversión reproductiva con costo reproductivo. No todas
son viables para cualquier especie. Datos útiles: ingestión energética real,
actividad o gasto, energía fecal/urinaria, estado reproductivo, trayectoria de
reservas o condición corporal. Deben proponer dos y explicar su utilidad.

**Cierre ATP.** Su producción y utilización pueden aumentar simultáneamente.
Una concentración casi estable no implica un flujo o recambio bajo.

**Complemento térmico.** 200/100 = 2 dentro del ejemplo de 20–30 °C. No autoriza
extrapolación a 50 °C: faltan tolerancia, aclimatación y respuesta de una especie.

## Lista de cotejo formativa

Marcar **logrado / en proceso / requiere apoyo**, y anotar una mejora concreta.

| Criterio anunciado al alumnado | Logrado | En proceso | Requiere apoyo |
|---|---|---|---|
| Reproducibilidad | Código y productos coinciden; parámetros identificados | Falta un bloque o un parámetro final | No se logra reproducir el cálculo |
| Corrección y unidades | Descuenta blanco y convierte g/kg; interpreta porcentaje | Un error localizado con procedimiento claro | Confunde concentración, tasa o masa |
| Balance | Calcula EM y ΔE sin doble conteo | Un error aritmético o de signo | Omite pérdidas o vuelve a contar gasto |
| Interpretación | Explica signo y cambios con mecanismo | Describe el resultado sin conectar mecanismo | Interpreta reserva como ingestión o ATP |
| Límites | Reconoce simulación y supuestos; dos datos reales pertinentes | Identifica solo un supuesto o dato pertinente | Generaliza a especies sin evidencia |

## Errores que conviene discutir

- Usar la pendiente negativa como consumo negativo sin definir la convención.
- Multiplicar una pendiente por minuto sin convertir después a horas.
- Dividir entre 10 g y etiquetar el resultado como por kg.
- Interpretar siete tiempos como siete réplicas biológicas.
- Confundir tasa de consumo de O₂ con producción exacta de ATP.
- Atribuir toda caída de O₂ al animal u omitir el volumen desplazado.
- Llamar estándar a cualquier tasa de reposo.
- Sumar actividad y digestión otra vez cuando ya están incluidas en M.
- Convertir kJ de reservas directamente a gramos de grasa sin información adicional.

## Fuentes, alcance y verificación

La presentación del curso `C6_Metabolismo_y_Suministro_de_Energia_Google_Slides.pptx`
fue la referencia de continuidad. Su lectura central es Willmer, P., Stone, G., &
Johnston, I. (2005). *Environmental physiology of animals* (2nd ed.). Blackwell
Publishing, capítulo 6. El QMD enlaza la documentación oficial de R y Quarto.

Los números son simulados y consistentes con los ejercicios del material. La recta
ideal sirve para explicar una pendiente; no representa incertidumbre experimental.
El presupuesto conserva pérdidas y producción para aislar efectos. Un estudio real
necesitaría un diseño y mediciones que no se desarrollan aquí.

Antes de clase, ejecuta `source("scripts/verificar.R", encoding = "UTF-8")` con
los parámetros originales. Después de cambiar el QMD, regenera el script con
`source("scripts/extraer_codigo.R", encoding = "UTF-8")` y vuelve a renderizar.
