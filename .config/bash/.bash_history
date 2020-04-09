sudo vim /etc/locale.gen
clear
os-prober
sudo os-prober
grub-mkconfig -o /boot/grub/grub.cfg
sudo grub-mkconfig -o /boot/grub/grub.cfg
sudo vim /boot/grub/grub.cfg
clear
logout
sudo pacman -S firefox
clear
sudo pacman -S i3-gaps
clear
vim /etc/locale.conf
clear
sudo locale-gen
clear
wifi-menu
vim .config/i3/config
dmenu
sudo pacman -S dmenu
clear
sudo pacman -S i3status
clear
wifi-menu
sudo pacman -S wifi-meny
sudo pacman -S wifi-menu
sudo wifi-menu
ip-link
dhcpcd
pacman -S dialog
sudo pacman -S dialog
clear
wifi-menu
dialog
clear
lspci -k
clear
pacman -S alacritty
sudo pacman -S alacritty
clear
alacritty
vim .profile
source .profile
ip link
ip link set wlan0 up
ip link show
iwconfig
netctl --h
lspci -h
lspci -k
wifi-menu
pacman -S dialog
sudo pacman -S dialog
clear
wifi-menu
iwconfig
lspci -k
clear
uname -a
pacman -Q linux
lsmod
clear
pacman -S broadcom-wl
sudo pacman -S broadcom-wl
clear
iwconfig
pip install
pacman -S python
sudo pacman -S python
clear
python
clear
ping google.com
clear
iwconfig
wifi-menu
lspci -k
clear
ip link set wl up
lspci -k
ip link
ip link set wlp3s0 up
sudo ip link set wlp3s0 up
dmesg | grep firmware
clear
dsmes | grep wlp3s0 
dmesg | grep wlp3s0 
iw dev wlp3s0 link
sudo pacman -S iw
iw dev wlp3s0 link
ip link
sudo ip link set wlp3s0 up
dmesg | grep wlp3s0 
dmesg | grep firmware
dmesg
clear
clear
clear
dmesg
dmesg | grep wlp3s0
dmesg | grep wl
dmesg | grep wlan0
clear
dmesg | grep wlan0
dmesg | grep wlp3s0
dmesg | grep firmware
gmesg
dmesg
clear
ls /lib/firmware/
ls /lib/firmware/ | grep regulatory
sudo pacman -S CRDA
sudo pacman -S crda
clear
dmesg | grep firmware
sudo pacman -S wireless-regdb
clear
cd /lib/firmware/
ls
cd brcm/
ls
sudo wget https://github.com/winterheart/broadcom-bt-firmware/raw/master/brcm/BCM20702A1-13d3-3404.hcd
sudo pacman -S wget
clear
sudo wget https://github.com/winterheart/broadcom-bt-firmware/raw/master/brcm/BCM20702A1-13d3-3404.hcd
clear
sudo modprobe -r btusb
sudo modprobe btusb
dmesg | grep firmware
lspci -k
ip link
lspci -k
dmesg
man dmesg
dmesg | grep wl
dmesg | grep taint
lspci -k
ip link
iw
clear
ip link
sudo iw dev wwlp3s0 scan
sudo iw dev wlp3s0 scan
sudo iw dev wlp3s0 link
sudo iw dev wlp3s0 scan
man iw
man iw
man iw | vim
vim
clear
sudo iw dev wlp3s0 scan | egrep "signal:|SSID:" | sed -e "s/\tsignal: //" -e "s/\tSSID: //" | awk '{ORS = (NR % 2 == 0)? "\n" : " "; print}' | sort
sudo iw dev wlp3s0 scan | ImANetwork
sudo iw dev wlp3s0 scan | grep ImANetwork
sudo iw dev wlp3s0 connect ImANetwork
sudo iw dev wlp3s0 link
sudo iw dev wlp3s0 link ImANetwork
sudo iw dev wlp3s0 connect ImANetwork
ip link set  wlp3s0 up
sudo ip link set  wlp3s0 up
iwlist interface scan | less
iwlist wlp3s0 scan | less
sudo iw dev wlp3s0 scan | egrep "signal:|SSID:" | sed -e "s/\tsignal: //" -e "s/\tSSID: //" | awk '{ORS = (NR % 2 == 0)? "\n" : " "; print}' | sort
clear
iwconfig
wifi-menu
dhcpcd
systemctl start dhcpcd@wlp3s0.servic
systemctl start dhcpcd@wlp3s0.service
pacman -S dhcp
sudo pacman -S dhcp
clear
systemctl start dhcpcd@wlp3s0.service
cd /etc/netctl
sudo pacman -S netctl
clear
cd /etc/netctl
cd /etc/netctl/examples/
ls
cp /etc/netctl/examples/wireless-wpa /etc/netctl/lukas
sudo cp /etc/netctl/examples/wireless-wpa /etc/netctl/lukas
cat /etc/netctl/lukas
vim /etc/netctl/lukas
sudo vim /etc/netctl/lukas
sudo vim /etc/netctl/lukas
clear
cd ..
cd ..
cd ..
ls /etc/netctl/
netctl start lukas
systemctl status netctl@lukas.service
clear
netctl end lukas
netctl stop lukas
clear
netctl start lukas
systemctl status netctl@lukas.service
clear
sudo cp /etc/netctl/examples/wireless-wpa /etc/netctl/test
sudo vim /etc/netctl/test
clear
netctl start lukas.
netctl start test.
systemctl status netctl@lukas..service
clear
netctl start test
systemctl status netctl@test..service
clear
cd /etc/netctl/
clear
netctl start test
systemctl status netctl@test..service
clear
systemctl status netctl@test.service
q
clear
 ip linnk set wlp3s0 down
 ip link set wlp3s0 down
sudo  ip link set wlp3s0 down
netctl start lukas
systemctl status netctl@lukas.service
clear
cd /etc/wpa_supplicant/
ls
systemctl status netctl@lukas.service
clear
htop
wpa_supplicant -iwlan0
wpa_supplicant -iwlp3s0
wpa_supplicant -iwlp3s0 -c /etc/wpa_supplicant/wpa_supplicant.conf -d
ls
cd ..
ls
man wpa_supplicant
dmesg | grep firmware
dmesg | grep wl
clear
htop
sudo pacman -S htop
sudo pacman -S neofetch
clear
neofetch
cd /etc/wpa_supplicant/
netctl start lukas
systemctl status netctl@lukas.service
clear
ip link stop
ip link set wlp3s0 down
sudo ip link set wlp3s0 down
clear
netctl start lukas
systemctl status netctl@lukas.service
clear
wifi-menu
sudo wifi-menu
systemctl status netctl@lukas.service
clear
sudo wifi-menu
clear
iwconfig
ip link set wlp3s0 up
sudo ip link set wlp3s0 up
iwlist interface scan | less
iwlist wlp3s0 scan | less
iwlist wlp3s0 scan | vim
iwlist wlp3s0 scan
clear
ip link set wlp3s0 down
sudo ip link set wlp3s0 down
ls
ls
cd ..
sudo vim /etc/netctl/
cd vim /etc/netctl/
cd /etc/netctl/
ls
sudo rm lukas
sudo rm test
clear
sudo wifi-menu
sudo wifi-menu
sudo wifi-menu
lspci
lspci -k
clear
sudo wifi-menu
sudo wifi-menu
lspci -k
wpa_passphrase 
wpa_passphrase ImANetwork
cd /etc/netctl/
clear
ls
sudo netctl start wlp3s0-ImANetwork
journalctl -xn
clear
iw dev wlp3s0 connect ImANetwork
sudo iw dev wlp3s0 connect ImANetwork
sudo netctl start wlp3s0-ImANetwork
cd /etc/wpa_supplicant/
ls
man wpa_passphrase
wpa_passphrase ImANetwork 2JaMaenpaaRi004
cd 'ctrl_interface=/var/run/wpa_supplicant' >> wifi.conf
echo 'ctrl_interface=/var/run/wpa_supplicant' >> wifi.conf
cd ~
echo 'ctrl_interface=/var/run/wpa_supplicant' >> wifi.conf
wpa_passphrase ImANetwork 2JaMaenpaaRi004 >> wifi.conf
wpa_supplicant -B -i wlp3s0 -c wifi.conf
sudo wpa_supplicant -B -i wlp3s0 -c wifi.conf
dhcpcd -A wlp3s0
ip addr
sudo pacman -S dhcpcd
clear
dhcpcd -A wlp3s0
sudo dhcpcd -A wlp3s0
cd /etc/wpa_supplicant/
ls
ls -la
ls -lah
cd ..
cd ..
cd `
cd ~
clear
vim wifi.conf
wpa_supplicant -i wlp3s0 -c wifi.conf -d
sudo wpa_supplicant -i wlp3s0 -c wifi.conf -d
sudo wpa_supplicant -i wlp3s0 -c wifi.conf -d
sudu pacman remove wpa_supplicant
sudo pacman remove wpa_supplicant
sudo pacman -S remove wpa_supplicant
man pacman
sudo pacman -R  wpa_supplicant
sudo pacman -S  wpa_supplicant
clear
sudo wpa_supplicant -i wlp3s0 -c wifi.conf -d
clear
cd /etc/wpa_supplicant/
ls
sudo cp ~/wifi.conf ./wpa_supplicant.conf
sudo wpa_supplicant -i wpl3s0
sudo wpa_supplicant -i wpl3s0 -c /etc/wpa_supplicant/wpa_supplicant.conf
lspci -k
lspci -k
ip link
sudo vim /etc/wpa_supplicant/wpa_supplicant.conf 
clear
cd ~
wpa_supplicant -Dn180211 -iwlp3s0 -c /etc/wpa_supplicant/wpa_supplicant.conf -d d -f test.log
vim test.log
wpa_supplicant -iwlp3s0 -c /etc/wpa_supplicant/wpa_supplicant.conf -d d -f test.log
vim test.log
rm test.log
sudo wpa_supplicant -iwlp3s0 -c /etc/wpa_supplicant/wpa_supplicant.conf -d d -f test.log
rm test.log
vim test.log
sudo wpa_supplicant -iwlp3s0 -c /etc/wpa_supplicant/wpa_supplicant.conf -d d -f test.log
vim test.log
sudo vim test.log
sudo wifi-menu
ip link set interface up
ip link set wlp3s0 up
sudo ip link set wlp3s0 up
sudo ip link set wlp3s0 down
sudo wifi-menu
sudo wifi-menu
systemctl status "netctl@wlp3s0\\x2dImANetwork_5G.service

systemctl status "netctl@wlp3s0dImANetwork_5G.service

systemctl status "netctl@wlp3s0\\x2dImANetwork_5G.service"
clear
sudo ip link set wlp3s0 down
cd /etc/netctl/
ls
sudo netctl start wlp3s0-ImANetwork
systemctl status "netctl@wlp3s0\\x2dImANetwork.service"
sudo netctl start wlp3s0-ImANetwork
sudo wifi-menu
cd /etc/netctl/
ls
vim wlp3s0-ImANetwork
sudo vim wlp3s0-ImANetwork
clear
wpa_supplicant -iwlp3s0 -c /etc/wpa_supplicant/wpa_supplicant.conf -d d -f temp.log
sudo vim temp.log 
sudo rm temp.log
clear
sudo wpa_supplicant -iwlp3s0 -c /etc/wpa_supplicant/wpa_supplicant.conf -d d -f temp.log
sudo vim temp.log 
sudo rm temp.log
ls
sudo wpa_supplicant -iwlp3s0 -c /etc/wpa_supplicant/wpa_supplicant.conf -d d -f temp.log
sudo wpa_supplicant -i-b -iwlp3s0 -c /etc/wpa_supplicant/wpa_supplicant.conf -d d -f temp.log
cd /var/run/wpa_supplicant/
ls
sudo vim wlp3s0
sudo vim wlp3s0
sudo rm wlp3s0
ls
iw dev
iw dev wlp3s0 connect ImANetwork
sudo iw dev wlp3s0 connect ImANetwork
sudo iw dev wlp3s0 connect ImANetwork
man iw
sudo iw dev wlp3s0 link
sudo iw dev wlp3s0 connect ImANetwork key 0:2JaMaenpaaRi004
sudo iw dev wlp3s0 connect "ImANetwork" key d:0:2JaMaenpaaRi004
sudo iw dev wlp3s0 connect ImANetwork key 2JaMaenpaaRi004
clear
wifi-menu
sudo wifi-menu
sudo ip link set interface up
sudo ip link set wlp3s0 up
iwlist wlp3s0 scan
ip link set wlp3s0 down
sudo ip link set wlp3s0 down
lspci -k
wifi-menu
sudo wifi-menu
systemctl status "netctl@wlp3s0\\x2dImANetwork.service"
sudo wpa_supplicant -i-b -iwlp3s0 -c /etc/wpa_supplicant/wpa_supplicant.conf -d d -f temp.log
vim temp.log
sudo vim temp.log
sudo rm /var/run/wpa_supplicant/wlp3s0
clear
sudo wpa_supplicant -i-b -iwlp3s0 -c /etc/wpa_supplicant/wpa_supplicant.conf -d d -f temp.log
ls /var/run/wpa_
cd /var/run/wpa_supplicant/
clear
wifi-menu
sudo wifi-menu
systemctl status "netctl@wlp3s0\\x2dImANetwork.service"
:q
clear
wifi-menu
sudo wifi-menu
systemctl status "netctl@wlp3s0\\x2dImANetwork.service"
cd /var/run/wpa_supplicant/
sudo /var/run/wpa_supplicant/
sudo cd /var/run/wpa_supplicant/
sudo cd /var/run/wpa_supplicant/
su
sudo wifi-menu
systemctl status "netctl@wlp3s0\\x2dImANetwork.service"
sudo pacman -R wpa_supplicant
sudo pacman -R iw
clear
sudo pacman -R wireless_tools
clear
sudo pacman -R iwd
c;ear
clear
wpa_cli status
sudo wpa_cli status
sudo pacman -R iw
sudo pacman -R crda
clear
sudo pacman -R wpa
cd /var/run/wpa_supplicant/
sudo pacman -S networkmanager
clear
nmcli
nmtui
man nmcli
nmtui
hostname
ping google.com
nmtui
sudo pacman -S zsh
vim .profile
chsh -s $(which zsh)
clear
scp luklun@aikbs-ws-2:.zshrc .
scp luklun@aibks-ws-2:.zshrc .
clear
ssh luklun@aibks-ws-2
clear
mkdir configs
scp luklun@aibks-ws-2:.config/i3/config .config/i3/config
scp luklun@aibks-ws-2:.config/compton.conf .config/compton.conf
clear
scp luklun@aibks-ws-2:.config/compton.conf .config/compton.conf
scp luklun@aibks-ws-2:
scp luklun@aibks-ws-2:
scp -r luklun@aibks-ws-2:.config/alacritty .config/
scp -r luklun@aibks-ws-2:.Pictures/wallpapers Pictures/
scp -r luklun@aibks-ws-2:Pictures/wallpapers Pictures/
neofetch
clar
clear
jupyter
clear
conda
exit
./mktrans.sh -f 5 corona/EPbuwXVXsAEja0U.jpg
feh corona/EPbuwXVXsAEja0U-transparent.png
exit
