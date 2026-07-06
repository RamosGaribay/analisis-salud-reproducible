# ============================================
# Autor: Ramos Garibay
# Fecha: 2026-07-06
# Descripción:
# Realiza un análisis exploratorio del conjunto
# de datos mediante estadísticas descriptivas,
# correlaciones y gráficos para comprender la
# distribución de las variables.
# ============================================

source("scripts/00_config.R")

datos <- read.csv("data/processed/heart_limpio.csv")

summary(datos)

cor(select(datos,
           age,
           trestbps,
           chol,
           thalach,
           oldpeak))

png("outputs/figures/histograma_edad.png")

hist(datos$age,
     main="Distribución de edades",
     xlab="Edad",
     col="lightblue")

dev.off()

write.csv(as.data.frame(summary(datos)),
          "outputs/tables/resumen.csv")

cat("Análisis exploratorio finalizado.\n")