#!/bin/bash

# Check root privileges
if [ "$EUID" -ne 0 ]; then
    echo -e "\e[91mPlease run as root (sudo ./portscan.sh)\e[0m"
    exit 1
fi

# Check nmap is installed
if ! command -v nmap &> /dev/null; then
    echo -e "\e[91mnmap is not installed. Run: sudo apt install nmap\e[0m"
    exit 1
fi

echo -e "\e[96mEnter the starting IP address : \e[0m"
read firstIP

echo -e "\e[96mEnter the last octet of the last IP address : \e[0m"
read lastoctetIP

echo -e "\e[96mEnter the port number to scan : \e[0m"
read port

# Basic input validation
if [[ -z "$firstIP" || -z "$lastoctetIP" || -z "$port" ]]; then
    echo -e "\e[91mError: all fields are required.\e[0m"
    exit 1
fi

echo -e "\e[96mScanning $firstIP-$lastoctetIP on port $port ...\e[0m"
nmap -sT "$firstIP-$lastoctetIP" -p "$port" -oG scan_results.txt

grep open scan_results.txt > open_ports.txt

echo -e "\e[96mOpen ports found :\e[0m"
cat open_ports.txt

echo -e "\e[32m  >> Operation finished successfully !  <<\e[0m"
