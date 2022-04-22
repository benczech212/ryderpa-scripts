ssh benczech@10.240.42.11
sudo su -
systemctl stop esb
mv /usr/share/fortna/wes/esb/ryderpa-esb.jar /usr/share/fortna/wes/esb/ryderpa-esb-backup.jar
mv /home/FORTNA/benczech/ryderpa-routes-1.0.0-SNAPSHOT.jar /usr/share/fortna/wes/esb/ryderpa-esb.jar
systemctl start esb
