(
user=benczech
fileName=ryderpa-routes-1.0.0-SNAPSHOT.jar
sourceFile=/home/benczech/github/ryder/ryderpa-esb/routes/target/$fileName
targetLocation=/usr/share/fortna/wes/esb/ryderpa-esb.jar
backupLocation=/usr/share/fortna/wes/esb/ryderpa-esb-backup.jar
remoteLocation=/home/FORTNA/benczech/$fileName
hostIp=10.240.42.13
sudo scp -C $sourceFile $user@$hostIp:$fileName
ssh $user@$hostIp
sudo su -
systemctl stop esb
mv $targetLocation $backupLocation
mv $remoteLocation $targetLocation
systemctl start esb
)



# mv /usr/share/fortna/wes/esb/ryderpa-esb.jar /usr/share/fortna/wes/esb/ryderpa-esb-backup.jar
# mv /home/FORTNA/benczech/ryderpa-routes-1.0.0-SNAPSHOT.jar /usr/share/fortna/wes/esb/ryderpa-esb.jar