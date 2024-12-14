#!/bin/bash

# Configuración
SOURCE="/home/matias/archivos_a_respaldar"  # Ruta del archivo o directorio a respaldar en formato UNIX (Remplaza por tu ruta)
BACKUP_DIR="/home/matias/backup"  # Ruta del directorio de respaldo en formato UNIX (Remplaza por tu ruta)
RETENTION_DAYS=30  # Días de retención de las copias antiguas (Ajusta segun tu modelo de negocio)

# Crear el directorio de respaldo si no existe
mkdir -p "$BACKUP_DIR"

# Crear el nombre del archivo de respaldo con la fecha actual
DATE=$(date +"%Y-%m-%d_%H-%M-%S")
BACKUP_NAME="backup_$DATE.tar.gz"

# Crear la copia de seguridad
tar -czf "$BACKUP_DIR/$BACKUP_NAME" -C "$(dirname "$SOURCE")" "$(basename "$SOURCE")"
if [ $? -eq 0 ]; then
    echo "Respaldo creado: $BACKUP_DIR/$BACKUP_NAME"
else
    echo "Error al crear la copia de seguridad."
    exit 1
fi

# Eliminar copias de seguridad antiguas
find "$BACKUP_DIR" -type f -name "backup_*.tar.gz" -mtime +$RETENTION_DAYS -exec rm {} \;
echo "Copias antiguas eliminadas (más de $RETENTION_DAYS días)."

# Programar ejecución automática con cron
CRON_JOB="05 21 * * * /bin/bash $(realpath "$0")" #(Puedes ajustar la hora en esta linea)
if ! crontab -l | grep -q "$(realpath "$0")"; then
    (crontab -l; echo "$CRON_JOB") | crontab -
    echo "Tarea programada para ejecutarse todos los días a las 21:05" #(Si cambias la hora ajusta tambien este echo para que concuerde y no genere confusiones).
fi
