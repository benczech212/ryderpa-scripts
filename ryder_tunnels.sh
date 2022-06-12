app1Ip=10.192.130.73
function sshp() {(sshpass -f ~/pass/pass_file ssh -o "StrictHostKeyChecking no" benczech@$*)}
function sshr() {(sshpass -f ~/pass/fortna_pass_file ssh -o "StrictHostKeyChecking no" root@$*)}
function sshb() {(sshpass -f ~/pass/builder_pass_file ssh -o "StrictHostKeyChecking no" builder@$*)}
function sshpt() {(sshpass -f ~/pass/pass_file ssh -o "StrictHostKeyChecking no" -C $1 benczech@$2)}
function sshrt() {(sshpass -f ~/pass/fortna_pass_file ssh -o "StrictHostKeyChecking no" -C $1 root@$2)}
function sshbt() {(sshpass -f ~/pass/builder_pass_file ssh -o "StrictHostKeyChecking no" -C $1 builder@$2)}
function amq(){
    (sshrt -L38091:localhost:8091 root@10.192.130.73)
}
function ev10(){
    (sshpt -L16080:10.192.130.82:16080 10.240.0.240)
}
function app1(){
    (sshpt -L28091:10.192.130.73:8091 10.240.0.240)   
}
function database(){
    sshpt -L31521:localhost:31521 10.240.0.240
    sshp 10.240.0.240 
    ssh -L31521:10.192.130.75:1521 root@10.192.130.75
}

sshpt -L18999:localhost:18999 10.240.0.240
sshp 10.240.0.240 
ssh -L18999:localhost:8999 root@10.192.130.73
#root password
ev10
