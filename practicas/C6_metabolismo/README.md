# C6 · Metabolismo y suministro de energía con R

Práctica de **100 minutos** para estudiantes que comienzan con R. Incluye dos casos
con fauna silvestre hipotética: consumo de oxígeno de un pez y presupuesto energético
de un roedor. Un reto combina menor ingestión y mayor gasto. Todos los datos son simulados.

## Inicio rápido

1. Descarga o actualiza el repositorio completo.
2. Entra en `practicas/C6_metabolismo/` y abre **C6_metabolismo.Rproj** en RStudio.
3. Para trabajar sin instalar paquetes, abre **C6_metabolismo.R** y ejecuta las secciones
   en orden con Ctrl + Enter. Para ejecutarlo completo:

```r
source("C6_metabolismo.R", encoding = "UTF-8")
```

El script guarda las tres gráficas en `resultados/graficas_C6.pdf` y las tablas en CSV.
Si prefieres ver una gráfica en Plots, vuelve a ejecutar su bloque después de cerrar
el dispositivo PDF (`dev.off()` al final del script). **Lee la guía HTML o QMD para
ver los escenarios, las preguntas y las instrucciones de entrega.**

Para proyectar sin R, descarga el repositorio y abre **C6_metabolismo.html** en el
navegador. El HTML incluye las gráficas y se puede leer sin conexión. No ejecuta R.
GitHub puede mostrar el código del HTML: descárgalo para abrirlo localmente.

## Cuaderno editable en Quarto

Abre **C6_metabolismo.qmd** y pulsa **Render** en RStudio. Requiere R, Quarto,
`knitr` y `rmarkdown`. Solo si esos paquetes faltan, instálalos una vez con internet:

```r
install.packages(c("knitr", "rmarkdown"), repos = "https://cloud.r-project.org")
```

También puedes ejecutar, desde esta carpeta:

```sh
quarto render C6_metabolismo.qmd
```

Los cálculos y gráficas usan **R base**. No requieren tidyverse, LaTeX ni acceso a
internet durante la práctica. No se instala software automáticamente desde los scripts.

## Archivos

| Archivo | Para qué sirve |
|---|---|
| `C6_metabolismo.qmd` | Guía, bloques comentados, preguntas y complemento opcional |
| `C6_metabolismo.html` | Guía ya ejecutada para proyectar o leer |
| `C6_metabolismo.R` | Código ejecutable sin Quarto ni paquetes adicionales |
| `C6_metabolismo.Rproj` | Abre la carpeta correcta en RStudio |
| `respuestas_C6.md` | Plantilla que completa el estudiante |
| `GUIA_DOCENTE.md` | Secuencia, respuestas, alineación y lista de cotejo |
| `datos/` | CSV simulados y diccionario de variables |
| `resultados/` | Tablas y PDF generados con los parámetros originales |
| `scripts/verificar.R` | Comprueba resultados originales y conservación de energía |
| `scripts/extraer_codigo.R` | Regenera el `.R` desde el `.qmd` |

## Actualizar desde GitHub

En la carpeta raíz de tu clon de Fisiologia, utiliza `git pull` si el material ya está
en tu rama actual. Si recibiste un enlace a una rama o solicitud de incorporación,
cambia a esa rama siguiendo los comandos de esa entrega antes de abrir el proyecto C6.
También puedes descargar el ZIP de la rama correspondiente desde GitHub.

## Al modificar

El QMD es la fuente del contenido. Tras editarlo:

```r
source("scripts/extraer_codigo.R", encoding = "UTF-8")
source("C6_metabolismo.R", encoding = "UTF-8")
```

Vuelve a pulsar Render para actualizar el HTML. El script extraído contiene los bloques
centrales; el complemento térmico permanece en el QMD. Los resultados se sobrescriben:
guarda tu variante en otra carpeta si deseas conservar los originales.

## Comprobación de los parámetros originales

```r
source("scripts/verificar.R", encoding = "UTF-8")
```

Resultado de referencia: consumo corregido **0.50 mg O₂/h** y **50 mg O₂/kg/h**;
reservas **+25**, **−35** y **−65 kJ/día** en los tres escenarios iniciales.
Si modificas las entradas del ejercicio, esta verificación fija puede fallar porque
sus expectativas corresponden a los datos originales.

## Problemas frecuentes

- **No encuentra un archivo:** abre el `.Rproj` dentro de C6; no ejecutes desde la raíz del repositorio.
- **Objeto no encontrado:** ejecuta los bloques anteriores en orden.
- **No veo la gráfica en Plots:** el `.R` envía las gráficas al PDF; ábrelo o vuelve a ejecutar un bloque al terminar.
- **Falta Quarto o un paquete:** usa el `.R` para trabajar y el HTML para leer; instala lo necesario para Render cuando tengas internet.
- **El resultado no cambia:** ejecuta nuevamente las líneas que dependen del parámetro modificado.
- **Aparece un error con decimales:** usa punto (`0.20`), no coma (`0,20`).

## Alcance y fuentes

Se basa en la presentación C6 del curso, especialmente sus diapositivas 22–26 y 32–39,
y en la lectura central allí indicada: Willmer, Stone y Johnston (2005),
*Environmental physiology of animals*, 2.ª ed., capítulo 6. Las referencias técnicas
están enlazadas en el QMD. No contiene datos de animales reales ni valores nutricionales
para manejo. La evaluación propuesta es formativa y no cambia porcentajes del curso.

## Validación de la entrega

Se ejecutó el script con **R 4.3.3** y se generó el HTML con **Quarto 1.10.18**.
Las comprobaciones de pendientes, unidades, conservación de energía y exportación
pasaron. Se revisaron las tres gráficas; el PDF contiene tres páginas. La ejecución
se probó en Linux; no se realizó una ejecución independiente en Windows.
