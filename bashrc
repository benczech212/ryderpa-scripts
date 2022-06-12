alias boots="sudo dnf remove *-meta-gi*; rm -f last*; ./bootstrap --incr --install rpm"
alias md='cd /home/builder/ryderpa-cc/build && make deploy && ssh -t builder@yumdev.fortna.net sudo /storage/yum/update-repo.sh customer/ryderpa' #deploy build 
alias deploybeta="ssh -t builder@yumdev.fortna.net ssh -t root@yumbeta.fortna.net sh /usr/local/bin/deploybeta.sh ryderpa" #deploy to beta repo
alias deploygold="ssh -t builder@yumdev.fortna.net ssh -t root@10.5.100.233 sh /usr/local/bin/deploygold.sh ryderpa" #deploy to gold/live/distro repo
alias deployprod="ssh -t builder@yumdev.fortna.net ssh -t root@yumbeta.fortna.net sh /usr/local/bin/deploybeta.sh ryderpa && ssh -t root@yumdev ssh -t root@yumbeta deploybeta.sh ryderpa && ssh -t root@yumdev ssh -t root@yumbeta ssh -t distro deploygold.sh ryderpa"
alias makeall="sudo dnf remove 'commcore-msghandler-ryderpa*' housekeeping-ryderpa-db ryderpa ryderpa-cc ryderpa-db ryderpa-msg; cd /home/builder/ryderpa-cc/ && rm -f */last*; cd /home/builder/ryderpa-cc/build && rm -f ./targets/* && make all"
