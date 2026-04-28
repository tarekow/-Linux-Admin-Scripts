# 🛠️ Linux Admin Scripts

A collection of simple Bash scripts to automate common Linux administration tasks.

---

## 📋 Scripts Overview

| Script | Description |
|--------|-------------|
| `sysinfo.sh` | Displays system information |
| `cleanup.sh` | Cleans the system |
| `update-me.sh` | Updates and upgrades all packages |
| `portscan.sh` | Scans a range of IPs on a specific port |

---

## 📄 Scripts in Detail

### 🖥️ `sysinfo.sh`
Displays a quick summary of your system's current state.

**Shows:**
- Hostname and current user
- Local IP address
- RAM usage (used / total)
- Disk usage on `/` (used / total / percentage)
- System uptime
- Kernel version
- Operating system name

**Example output:**
```
========== System Information ==========
Host-Name       : kali
User            : root
IP Address      : 192.168.x.x
RAM             : 1.2G / 7.7G
Disk            : 18G / 50G (36% used)
Uptime          : up 2 hours, 14 minutes
Kernel          : 6.1.0-kali9-amd64
OS              : Kali GNU/Linux Rolling
========================================
```

---

### 🧹 `cleanup.sh`
Frees up disk space by cleaning unnecessary files accumulated over time.

**What it does, step by step:**
1. **Cleans apt cache** — removes downloaded `.deb` package files stored in `/var/cache/apt/`
2. **Removes unused packages** — uninstalls dependencies that are no longer needed by any program
3. **Deletes temporary files** — wipes `/tmp/` and `/var/tmp/` which can accumulate a lot of junk
4. **Shrinks system logs** — uses `journalctl` to keep logs under 50MB, removing old entries

> Useful to run periodically to keep your system clean and save disk space.

---

### 🔄 `update-me.sh`
Keeps your system fully up to date in one command.

**What it does, step by step:**
1. **Updates package list** — fetches the latest available versions from repositories (`apt update`)
2. **Upgrades installed packages** — installs the newer versions of everything already on your system (`apt upgrade -y`)
3. **Auto-removes leftovers** — cleans up packages that became unnecessary after the upgrade (`apt autoremove -y`)

> Equivalent to running three `apt` commands manually, combined into one script.

---

### 🔍 `portscan.sh`
Scans a range of IP addresses to check if a specific port is open.

**What it does, step by step:**
1. **Asks for a starting IP** — e.g. `192.168.1.1`
2. **Asks for the last octet of the ending IP** — e.g. `50` (will scan up to `192.168.1.50`)
3. **Asks for a port number** — e.g. `80`, `22`, `443`
4. **Runs nmap** — performs a TCP connect scan (`-sT`) on the full IP range and saves raw results to `scan_results.txt`
5. **Filters open ports** — extracts only the lines where the port is open and saves them to `open_ports.txt`
6. **Displays the results** — prints the open ports directly in the terminal

> ⚠️ Only use this script on networks you own or have explicit permission to scan.

---

## ⚙️ Usage

**1. Give execution permission:**
```bash
chmod +x script-name.sh
```

**2. Run with sudo (required):**
```bash
sudo ./script-name.sh
```

> ⚠️ All scripts require root privileges. They will display an error and exit if not run as root.

---

## 📌 Requirements

- Linux (Debian/Ubuntu/Kali based)
- `nmap` installed for `portscan.sh` → `sudo apt install nmap`

---

## 🙋 About

Made by **Tarek** — BTS student in Network Administration & Security (ASRI), Algeria.

---

## 📄 License

MIT License — free to use and modify.
