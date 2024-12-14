# bash_backup
Script en bash pensado para Linux/Unix que realiza una copia de seguridad de los aarchivos que esten en un determinado directorio a un disco externo


Guía para Probar el Script de Respaldo

  1) Verifica que tu sistema tiene instalados Bash, Tar y Cron. Si falta alguno, instálalo usando estos comandos:
      sudo apt update
      sudo apt install cron tar
      sudo systemctl enable cron && sudo systemctl start cron

  2) Clona el repositorio o descarga el script y navega al directorio donde está guardado. Por ejemplo:
      git clone <URL_del_Repositorio>
      cd <nombre_del_repositorio>

  3) Asegúrate de que el script sea ejecutable con este comando:
      chmod +x respaldo.sh

  4) Edita el archivo respaldo.sh para ajustar las rutas de SOURCE y BACKUP_DIR. Puedes usar un editor como nano:
      nano respaldo.sh Cambia las rutas según tus necesidades. Por ejemplo:
      SOURCE="/home/usuario/Downloads/comandos"
      BACKUP_DIR="/home/usuario/backup"

  5) Ejecuta el script manualmente para probar que funciona correctamente:
      ./respaldo.sh Verifica que se haya creado un archivo de respaldo en el directorio configurado y que las copias antiguas se hayan eliminado.

  6) Programa la ejecución automática del script con cron:
      Abre el crontab con crontab -e.
      Añade esta línea para que el script se ejecute todos los días a las 17:34:
          34 17 * * * /bin/bash /ruta/completa/a/respaldo.sh
  7) Guarda el archivo
