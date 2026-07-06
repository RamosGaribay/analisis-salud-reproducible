# ============================================
# Autor: Ramos Garibay
# Fecha: 2026-07-06
# Descripción:
# Limpia el conjunto de datos eliminando valores
# faltantes, convirtiendo variables categóricas
# en factores y guardando un nuevo archivo listo
# para el análisis estadístico.
# ============================================
source("scripts/00_config.R")

library(tidyverse)

# Leer datos
datos <- read.csv("data/raw/heart.csv")

# Revisar estructura
str(datos)
summary(datos)

# Eliminar filas con valores faltantes
datos <- datos |> drop_na()

# Convertir sexo a factor
datos$sex <- factor(
  datos$sex,
  levels = c(0, 1),
  labels = c("Mujer", "Hombre")
)

# IMPORTANTE:
# NO convertir target a texto.
# Debe permanecer como 0 y 1.

# Guardar datos limpios
write.csv(
  datos,
  "data/processed/heart_limpio.csv",
  row.names = FALSE
)

cat("Limpieza completada.\n")