# First push any changes to a development branch on GitHub & create a pull request
# Merge with the master branch
# Observe in Jenkins that the build complete successfully
# Make note of the build number, and update the MetaRPM config file to reflect the new build number
# 

# ssh into builder

ssh builder@10.240.42.10
# pass: builder
deploybeta && ssh root@yumdev
# pass: fortnaRH1
ssh root@yumbeta
# pass: fortnaRH1
ssh root@yumbeta
deploybeta.sh metcobuildingg && ssh distro
deploygold.sh metcobuildingg
exit && exit && exit &&
ssh -L28091:10.192.130.73:8091 10.240.0.240 ssh root@10.192.130.73 #SSH to APP1
ssh root@10.192.130.73 # app 1

#that should update the meta-rpm and the esb rpms -- assuming only esb changed
# then once that's done, restart esb but you need to use "pcs" and not "systemctl"
alias metarpm_packagename=''
alias metarpm_update='(sudo dnf clean all && sudo dnf update metcobuildingg-meta-rpm --allowerasing -y)'
alias metarpm_which='(sudo dnf list installed | grep metcobuildingg-meta-rpm*)'

alias esb_restart='(pcs resource disable esb-group && sleep 1 && pcs resource enable esb-group && sleep 5 && pcs status | grep esb )'       #esb_restart'
alias cc_restart='(pcs resource disable cc-group && sleep 1 && pcs resource enable cc-group && sleep 5 && pcs status | grep cc )'          #cc_restart'
alias ev10_restart='(pcs resource disable wcsui-group && sleep 1 && pcs resource enable wcsui-group && sleep 5 && pcs status | grep wcsui )' #EV10_restart

alias wes_status='pcs status | grep svc'
alias wes_restart='(pcs resource disable esb-group && pcs resource disable cc-group && pcs resource disable wcsui-group) && sleep 1 && (pcs resource enable esb-group && pcs resource enable cc-group && pcs resource enable wcsui-group) && sleep 5 && pcs status | grep ryderpa'

alias cc_which='(sudo dnf list installed | grep cc)'
alias ev10_which='(sudo dnf list installed | grep wcsui)'       
alias esb_which='(sudo dnf list installed | grep esb-rpm)'
alias wes_which='(sudo dnf list installed | grep ryderpa)'

alias esb_logs='(cd /nfsshare/esb/log/wes/ && tail -f $(ls -t esb-engine* | head -1))'
alias esb_logs_netty='(cd /nfsshare/esb/log/wes/ && tail -f $(ls -t esb-engine* | head -1))'

alias dbinit='(cd /usr/share/fortna/*-util*/scripts && (nohup ./install_reset_all.sh --profile dev > reset.log 2>&1 &) && tail -f reset.log)'
alias dbinit_log='(cd /usr/share/fortna/*-util*/scripts && tail -f reset.log)'

alias sshryderprod='ssh -L28091:10.192.130.73:8091 10.240.0.240' #SSH to APP1

#pcs status shows you the status of all of the clustered resource groups

(dnf clean all && dnf update metcobuildingg-meta-rpm --allowerasing -y) && (pcs resource disable esb-group && pcs resource enable esb-group) && sleep 4 && pcs status | grep esb
(cd /var/log/wes/ && tail -f $(ls -t esb-engine* | head -1))

#
alias esb_stop='(cd /usr/share/fortna/metcobuildingg-utilities/scripts/ && ./wesService.sh stop --service esb --profile dev)'
alias esb_start='(cd /usr/share/fortna/metcobuildingg-utilities/scripts/ && ./wesService.sh start --service esb --profile dev)'




ssh -L16080:10.192.130.82:16080 10.240.0.240 #EV10 jump server

ssh -L8999:10.192.13.73:8999 10.240.0.240 #HawtIO METCO
10.240.40.21

sshmetcodev 

sshpass -f ~/pass/pass_file ssh -o "StrictHostKeyChecking no" -C benczech@


sshpass -f ~/pass/pass_file ssh root@yumbeta sh deploybeta.sh metcobuildingg && ssh distro sh deploygold.sh metcobuildingg


function metco_deploybeta() {
(
sshpass -f ~/pass/builder_pass_file deploybeta
sshpass -f ~/pass/fortna_pass_file ssh root@yumbeta sh deploybeta.sh metcobuildingg 
sshpass -f ~/pass/fortna_pass_file ssh -t root@yumbeta ssh root@distro sh deploygold.sh metcobuildingg
sshpass -f ~/pass/fortna_pass_file ssh root@10.240.40.23 dnf clean all && dnf update metcobuildingg-meta-rpm --allowerasing -y

)
}

function metco_deploydev() {
(
sshpass -f ~/pass/fortna_pass_file ssh root@10.240.40.21 dnf clean all && dnf update metcobuildingg-meta-rpm --allowerasing -y
)
}


# #
ssh -L31521:localhost:31521 10.240.0.240
ssh 10.240.0.240
ssh -L31521:10.192.130.75:1521 root@10.192.130.80


ssh -L38091:localhost:8091 10.240.0.240

#to the jump vm from local:  ssh -L31521:localhost:31521 10.240.0.240
#then in SQL dev use localhost:31521



grep -R 00004796800092643905 /var/log/*/*.log


ssh -L38999:localhost:8999 10.240.0.240