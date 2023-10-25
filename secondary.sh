#Created by @nikolascepo
#jasper automated replication

#!/bin/bash

timestamp="$(date +'%d-%m-%y-%T')"

sshpass -p 'yourpasswordhere' scp -o StrictHostKeyChecking=no /path/jasperreports-server-cp-7.8.0/report-ex.zip username@ip:/path/jasperreports-server-cp-7.8.0/

#Report of report transfer

if [ $? -eq 0 ]
then
    echo "[${timestamp}] Remote Export Success. SCP to app.coinis server successful. " >> /path/jasperreports-server-cp-7.8.0/buildomatic/replica-log/export-report.txt
else
    echo "[${timestamp}] Remote Export Failure. SCP to app.coinis server failed. " >> /path/jasperreports-server-cp-7.8.0/buildomatic/replica-log/export-report.txt
fi
