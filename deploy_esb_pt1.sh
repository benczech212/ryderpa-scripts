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
hostIp=10.240.42.11
sudo scp -C $sourceFile $user@$hostIp:$fileName
sudo scp -C $scriptSource $user@$hostIp:$scriptName
ssh $user@$hostIp sudo ./$scriptName
)



# mv /usr/share/fortna/wes/esb/ryderpa-esb.jar /usr/share/fortna/wes/esb/ryderpa-esb-backup.jar
# mv /home/FORTNA/benczech/ryderpa-routes-1.0.0-SNAPSHOT.jar /usr/share/fortna/wes/esb/ryderpa-esb.jar