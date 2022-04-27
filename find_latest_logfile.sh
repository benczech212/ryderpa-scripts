# open latest log file
(cd /var/log/wes/ && tail -f $(ls -t esb-engine* | head -1))

# wms emulator
(cd /var/log/wmsemulator/ && tail -f $(ls -t | head -1))