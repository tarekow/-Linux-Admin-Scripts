#!/bin/bash

echo -e "\e[96m========== System Information ==========\e[0m"
echo "Host-Name       : $(hostname)"
echo "User            : $(whoami)"
echo "IP Address      : $(hostname -I | awk '{print $1}')"
echo "RAM             : $(free -h | awk '/Mem/{print $3 "/" $2}')"
echo "Disk            : $(df -h / | awk 'NR==2{print $3 "/" $2 " (" $5 " used)"}')"
echo "Uptime          : $(uptime -p)"
echo "Kernel          : $(uname -r)"
echo "OS              : $(lsb_release -d | awk -F: '{print $2}' | xargs)"
echo -e "\e[96m========================================\e[0m"
echo -e "\e[32m  >> Operation finished successfully !  <<\e[0m"
