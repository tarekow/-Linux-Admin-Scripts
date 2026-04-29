#!/bin/bash

# Check root privileges
if [ "$EUID" -ne 0 ]; then
    echo -e "\e[91mPlease run as root (sudo ./update-me.sh)\e[0m"
    exit 1
fi

echo -e "\e[96mUpdating package list...\e[0m"
apt update

echo -e "\e[96mUpgrading packages...\e[0m"
apt upgrade -y

echo -e "\e[96mAuto-removing unused packages...\e[0m"
apt autoremove -y

echo -e "\e[32m  >> Operation finished successfully !  <<\e[0m"
