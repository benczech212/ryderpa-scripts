#!/bin/sh
(
user=benczech
fileName=ryderpa-routes-1.0.0-SNAPSHOT.jar
sourceFile=/home/benczech/github/ryder/ryderpa-esb/routes/target/$fileName
targetLocation=/usr/share/fortna/wes/esb/ryderpa-esb.jar
backupLocation=/usr/share/fortna/wes/esb/ryderpa-esb-backup.jar
remoteLocation=/home/FORTNA/benczech/$fileName
scriptName=deploy_esb_pt2.sh
scriptSource=/home/benczech/github/ryder/ryderpa-scripts/$scriptName
sudo su -
systemctl stop esb
mv -f $targetLocation $backupLocation
mv -f $remoteLocation $targetLocation
systemctl start esb
cd /var/log/wes/ && tail -f $(ls -t esb-engine* | head -1)
)



# mv /usr/share/fortna/wes/esb/ryderpa-esb.jar /usr/share/fortna/wes/esb/ryderpa-esb-backup.jar
# mv /home/FORTNA/benczech/ryderpa-routes-1.0.0-SNAPSHOT.jar /usr/share/fortna/wes/esb/ryderpa-esb.jar