# backup-remote-ftp
Script en linux para generar backup(archivos y base de datos), comprimirlo y enviarlo a un sitio remoto via ftp

- Copiar el script en el servidor del cual se desea realizar el backup.
- Configurar los parámetros(usuario y password ftp, directorio que se desea respaldar, directorio en donde se realizara el respaldo y password de la base de datos a respaldar).
- Crear un cron para realizar el backup en forma periódica.
