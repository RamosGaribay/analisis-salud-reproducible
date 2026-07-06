# ============================================
# Autor: Ramos Garibay
# Fecha: 2026-07-06
# Descripción:
# Configura el entorno de trabajo del proyecto,
# carga las librerías necesarias, define las rutas
# de los archivos y crea automáticamente las carpetas
# requeridas para almacenar los datos y resultados.
# ============================================

# Instalar paquetes si no existen
paquetes <- c("tidyverse", "ggplot2")

instalados <- paquetes %in% rownames(installed.packages())

if(any(!instalados)){
  install.packages(paquetes[!instalados])
}

# Cargar librerías
library(tidyverse)
library(ggplot2)

# Definir rutas
ruta_raw <- "data/raw"
ruta_processed <- "data/processed"
ruta_figuras <- "outputs/figures"
ruta_tablas <- "outputs/tables"

# Crear carpetas automáticamente
dir.create(ruta_raw, recursive = TRUE, showWarnings = FALSE)
dir.create(ruta_processed, recursive = TRUE, showWarnings = FALSE)
dir.create(ruta_figuras, recursive = TRUE, showWarnings = FALSE)
dir.create(ruta_tablas, recursive = TRUE, showWarnings = FALSE)

cat("Configuración completada correctamente.\n")