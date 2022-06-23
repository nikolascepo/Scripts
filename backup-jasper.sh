#Jasper Report Backup Scrips
#All $PATHs in script need to be adapted to the users specifications
#Prequisites:
#Create a script under Jasper user for permissions
#Create a file without any permissions (chmod 400) for safekeeping of password 
#Create a cronjob under Jasper user on every 2-3 days
#Created by @nikola.scepo


#!/bin/bash

timestamp="$(date +'%d-%m-%y-%H-%M')"

cd /home/jasper/jasperreports-server-cp-7.8.0/buildomatic

#Export all Jasper Server reports

./js-export.sh --everything --output-zip /home/jasper/backup/reports-backup-${timestamp}.zip --destkeystore $NAME --deststorepass $PASS --genkey

#Report of export

if [ $? -eq 0 ]
then
    echo "[${timestamp}] Export of Backup Successful." >> $PATH
else
    echo "[${timestamp}] Export of Backup Failed." >> $PATH
fi

#Scp new file to backup server

sshpass -p $(cat ~/.jspr.txt) scp /home/jasper/backup/reports-backup-${timestamp}.zip $USER@$IP:$PATH

#Report of backup

if [ $? -eq 0 ]
then
    echo "[${timestamp}] Backup to Remote Server Successful." >> $PATH
else
    echo "[${timestamp}] Backup to Remote Server Failed " >> $PATH
fi

#Remove all files older than 5 days

find "$YOURFILE" -type f \( -name "*.zip" \) -mtime +5 -exec rm {} \;
