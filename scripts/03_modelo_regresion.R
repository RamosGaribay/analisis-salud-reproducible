# ============================================
# Autor: Ramos Garibay
# Fecha: 2026-07-06
# Descripción:
# Ajusta un modelo de regresión logística para
# evaluar la relación entre las variables
# predictoras y la presencia de enfermedad
# cardíaca.
# ============================================

source("scripts/00_config.R")

library(tidyverse)

# Leer datos
datos <- read.csv("data/processed/heart_limpio.csv")

# Convertir sexo a factor
datos$sex <- factor(
  datos$sex,
  levels = c("Mujer", "Hombre")
)

# Asegurar que target sea numérico (0 y 1)
datos$target <- as.numeric(datos$target)

# Ajustar modelo
modelo <- glm(
  target ~ age +
    sex +
    trestbps +
    chol +
    thalach,
  data = datos,
  family = binomial(link = "logit")
)

# Mostrar resultados
summary(modelo)

# Guardar resultados
sink("outputs/tables/modelo_regresion.txt")
cat("Resumen del modelo de regresión logística\n\n")
print(summary(modelo))
sink()

cat("Modelo ejecutado correctamente.\n")