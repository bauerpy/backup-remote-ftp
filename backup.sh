backup1=/directorio/para/realizar/backup
backupdir=/directorio/en/el/cual/se/realizara/el/backup
nombrearchivo=`date +%Y-%m-%d-%H-%M-%S`
passbd=*********
sitio-ftp= mi.sitio.ftp
userftp=usuario-ftp
passftp=*********

#eliminar archivos con mas de 7 dias
find "$backupdir"/*.tar.gz -mtime +7 -exec rm {} \;

echo "Creando backup $nombrearchivo .tar.gz"

mkdir "$backupdir$filename"

# dump de la base de datos

export PGPASSWORD=$passbd
pg_dump -h localhost -U usuario_db  > "$backupdir$nombrearchivo"/db.sql

#copiar directorios
cp -r $backup1 "$backupdir$nombrearchivo"/directorio_backup1

#tar del archivo
tar -czf "$nombrearchivo".tar.gz "$backupdir$nombrearchivo"

#borrar la carpeta
rm -Rf $backupdir$nombrearchivo
#login al sitio ftp, borra el backup viejo y levanta el nuevo
pftp -inv $sitio-ftp <<EOF
user $userftp $passftp
mdelete *.tar.gz
binary
put "$nombrearchivo".tar.gz 
bye
EOF
