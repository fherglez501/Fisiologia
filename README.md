# Fisiologia

## Tamaño y escala en fauna silvestre con R

Proyecto de Quarto para explicar geometría, alometría, metabolismo y locomoción
con datos simulados. Incluye una ruta de clase de 45–60 minutos, ampliaciones,
ejercicios comentados y soluciones desplegables.

**Todos los datos son artificiales.** No son estimaciones fisiológicas ni rangos
biológicos de las especies. Los coeficientes no sirven para manejo clínico,
alimentación o experimentación con animales.

## Para usarlo inmediatamente

Para clonar desde PowerShell o una terminal con Git instalado:

```sh
git clone https://github.com/fherglez501/Fisiologia.git
cd Fisiologia
```

También puedes usar **Code → Download ZIP** en GitHub y descomprimir la carpeta.

1. Clona el repositorio o descomprime el ZIP completo en una carpeta con permiso de escritura.
2. Para proyectar sin instalar nada, abre **tamano_escala_fauna.html** en el navegador.
3. Para trabajar con R, abre **FisiologiaFauna.Rproj** en RStudio.
4. En la consola de R ejecuta:

```r
source("INICIAR.R", encoding = "UTF-8")
```

La primera vez puede necesitar internet para instalar `knitr` y `rmarkdown`.
Después, las simulaciones, los CSV y las gráficas funcionan localmente. El HTML
incluye sus recursos y no requiere internet para leerlo; sus enlaces externos sí.

## Requisitos para editar y generar

- [R](https://cran.r-project.org/), 4.2 o posterior.
- [RStudio Desktop](https://posit.co/download/rstudio-desktop/) para abrir el proyecto.
- [Quarto](https://quarto.org/docs/get-started/), 1.4 o posterior. Algunas
  instalaciones recientes de RStudio ya lo incluyen.
- Paquetes R `knitr` y `rmarkdown`; el resto son sus dependencias. No se necesita
  instalar todo tidyverse ni LaTeX. Las figuras se crean con **R base**.

En RStudio también puedes abrir `tamano_escala_fauna.qmd` y pulsar **Render**.
Ejecuta el bloque Preparación antes de los demás. Busca `CAMBIA AQUÍ` para
modificar los ejercicios. Las respuestas aparecen en cajas desplegables.

## Desde la terminal

Los siguientes comandos se ejecutan **dentro de la carpeta del proyecto**:

```sh
Rscript scripts/instalar_paquetes.R
Rscript scripts/verificar.R
quarto render tamano_escala_fauna.qmd
```

Si `Rscript` o `quarto` no están en el PATH de Windows, utiliza RStudio o agrega
las carpetas de instalación al PATH. No hace falta cambiar la política de
ejecución de PowerShell.

## Contenido

| Archivo o carpeta | Uso |
|---|---|
| `tamano_escala_fauna.qmd` | Documento didáctico y código comentado |
| `tamano_escala_fauna.html` | Versión preparada para proyectar |
| `FisiologiaFauna.Rproj` | Abre el directorio de trabajo correcto |
| `INICIAR.R` | Instala paquetes faltantes, verifica y genera el HTML |
| `R/funciones.R` | Simuladores, tablas y exportación de figuras |
| `ejercicios/ejercicios_comentados.R` | Todos los bloques R en orden |
| `datos/` | CSV de los escenarios y diccionario de variables |
| `resultados/figuras/` | Nueve figuras PNG para reutilizar en clase |
| `resultados/sesion_R.txt` | Versiones del entorno con el que se generó |
| `scripts/verificar.R` | Verificaciones numéricas y de reproducibilidad |
| `scripts/extraer_codigo.R` | Regenera el script a partir del QMD |

## Ruta sugerida para clase

1. **Geometría:** duplicar longitud no duplica volumen.
2. **Mamíferos:** más gasto total puede coexistir con menos gasto por kilogramo.
3. **Logaritmos:** una potencia se convierte en una recta.
4. **Ajolotes:** comparar temperaturas después de considerar masa.
5. **Transporte:** separar potencia, energía por distancia y costo específico.
6. **Cierre:** identificar qué dato real falta para una conclusión biológica.

Las ampliaciones cubren nueve grupos: anfibios, reptiles, aves, mamíferos pequeños,
medianos y grandes, elasmobranquios, otros peces e invertebrados. También se
incluyen residuos, alcance aeróbico y equivalencia energética.

## Si cambias el material

Edita primero el QMD y, si necesitas cambiar cómo se simulan los datos, el archivo
`R/funciones.R`. Luego ejecuta:

```r
source("scripts/extraer_codigo.R", encoding = "UTF-8")
```

Renderiza nuevamente para actualizar las figuras y CSV. El script de verificación
comprueba el escenario inicial; si cambias sus parámetros de diseño, revisa también
las expectativas numéricas correspondientes. Una semilla fija reproduce la muestra,
pero las versiones futuras de software pueden afectar algunos detalles.

## Problemas habituales

- **No se encuentra R/funciones.R:** abre el `.Rproj`; evita ejecutar desde otra carpeta.
- **Objeto no encontrado:** ejecuta Preparación y los bloques anteriores en orden.
- **Falta knitr o rmarkdown:** ejecuta `scripts/instalar_paquetes.R` con internet.
- **Quarto no aparece:** pulsa Render en RStudio o instala Quarto y reinicia RStudio.
- **Una gráfica no coincide:** comprueba semilla y valores `CAMBIA AQUÍ`.
- **Caracteres extraños al leer CSV:** usa `read.csv(..., fileEncoding = "UTF-8")`.

## Fuentes

Desarrolla el tema de la presentación del curso
[C3 Problemas de tamaño y escala](https://docs.google.com/presentation/d/19fHNEmJril-AAz-jaYxPyHRO4Wk6N683NOjwgskH57A/edit).
Lectura central indicada en ella: Willmer, Stone y Johnston (2005),
*Environmental physiology of animals*, 2.ª edición, capítulos 1–3.
Las referencias adicionales y enlaces a documentación oficial están en el QMD.
No se incluyen figuras copiadas del libro ni datos de animales reales.

## Validación de esta entrega

Se ejecutaron los bloques con R 4.3.3 y se generó el HTML con Quarto 1.10.18.
Las comprobaciones de geometría, unidades, datos positivos y reproducibilidad
pasaron. Se revisaron las nueve figuras. El proyecto entrega 315 registros
simulados de nueve grupos y 90 registros adicionales del escenario de ajolotes.
