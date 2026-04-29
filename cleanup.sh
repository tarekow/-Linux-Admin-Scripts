#!/bin/bash

# Check root privileges
if [ "$EUID" -ne 0 ]; then
    echo -e "\e[91mPlease run as root (sudo ./cleanup.sh)\e[0m"
    exit 1
fi

echo -e "\e[96m1. Cleaning apt cache...\e[0m"
apt clean

echo -e "\e[96m2. Removing unnecessary packages...\e[0m"
apt autoremove -y

echo -e "\e[96m3. Removing temporary files...\e[0m"
rm -rf /tmp/*
rm -rf /var/tmp/*

echo -e "\e[96m4. Cleaning log files...\e[0m"
journalctl --vacuum-size=50M

echo -e "\e[32m  >> Operation finished successfully !  <<\e[0m"
