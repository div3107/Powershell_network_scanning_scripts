# 🖥️ **Network Scanning PowerShell Scripts** 🖥️

## Created by **Lostboy** 🦸‍♂️

---

Welcome to the **Network Scanning PowerShell Scripts** repository! This repo contains various PowerShell scripts designed for network scanning tasks, including IP range scanning, port scanning, and system enumeration. 

### Scripts Included:
- **netdiscovery.ps1** - A script to discover active hosts in a specified IP range.
- **portstorm.ps1** - A fast and asynchronous port scanner.
- **enumerator.ps1** - A script for gathering essential system information and performing local enumeration.

Feel free to explore and contribute! 🚀

---

### Contact:
- GitHub: [Lostboy's GitHub](https://github.com/Lostboy)
- LinkedIn: [Lostboy LinkedIn](https://www.linkedin.com/in/lostboy)

# Powershell_network_scanning_scripts
PowerShell Scripts for Network Scanning  A collection of efficient and powerful PowerShell scripts designed for network reconnaissance, host enumeration, and port scanning. This repository provides various tools to help security professionals and network administrators quickly gather valuable information about the systems and networks they manage.
## Scripts Included

### 1. **Enumerator.ps1**
A local enumeration script that gathers key system information, such as:
- System info (OS version, architecture, BIOS details)
- Installed software and antivirus products
- User accounts and groups
- Network configuration (IP address, active TCP connections)
- Disk information (storage usage)

#### Usage:
```powershell
.\enumerator.ps1
```

### 2. **NetDiscovery.ps1** 
A simple and fast PowerShell script designed to scan a specified IP range within a given network and display the online/offline status of each host. It uses ICMP ping to check whether each host in the range is responsive.

#### Features
- **Fast Network Discovery**: Quickly scan a range of IP addresses to check if hosts are online or offline.
- **Customizable Range**: Define both the network subnet and the range of host IDs to scan.
- **Easy-to-use**: No complex setup required. Simply specify the range and start scanning.
- **Ideal for Network Admins & Penetration Testers**: Useful for discovering active hosts in a local network during audits or troubleshooting.

#### Script Overview
This script sends ICMP (ping) requests to each host in a specified IP range and reports whether the host is online or offline. It’s efficient for quickly discovering live devices on a network.

#### Prerequisites
- **PowerShell**: Requires PowerShell 5.1 or higher (Windows) or PowerShell Core (cross-platform).
- **Network Access**: Ensure the script has access to the target network and that ICMP requests are not blocked by a firewall.

#### Parameters
The script takes two parameters:

- **`-ip_network`**: The network address (e.g., `"192.168.1."`).
- **`-ip_range`**: The range of host IDs to scan (e.g., `(1..254)`).

#### Example Usage

1. **Scan a local network range:**

```powershell
.\netdiscovery.ps1 -ip_network "192.168.1." -ip_range (1..255)
```

### 3.PortStorm.ps1 - Asynchronous Port Scanner

**PortStorm.ps1** is an efficient and fast PowerShell script designed to scan a specified range of IP addresses and ports to identify open ports on each host. It uses asynchronous TCP connections to ensure a rapid scan of the network.

#### Features
- **Asynchronous Scanning**: Uses asynchronous TCP connections for fast, non-blocking port scans.
- **Customizable IP and Port Range**: Define both the IP range and the list of ports you want to scan.
- **Efficient**: Scans multiple hosts and ports quickly, saving time compared to traditional sequential port scanners.
- **Ideal for Penetration Testing & Network Audits**: Quickly identify open ports on a network, ideal for Red Team engagements and vulnerability assessments.

#### Script Overview
The script performs an asynchronous port scan by testing a range of IP addresses and ports. It reports whether a specific port is open or closed on each host, helping network administrators and security professionals identify potential vulnerabilities.

#### Prerequisites
- **PowerShell**: Requires PowerShell 5.1 or higher (Windows) or PowerShell Core (cross-platform).
- **Network Access**: Ensure that you have proper access to the target network and that the target ports are not blocked by a firewall.

#### Parameters
The script accepts the following parameters:

- **`-ip_network`**: The network address (e.g., `"192.168.1."`).
- **`-ip_range`**: The range of host IDs to scan (e.g., `(1..254)`).
- **`-port_range`**: The range of ports to scan (e.g., `80, 443, 22`).

#### Example Usage

1. **Scan a range of IP addresses for specific ports:**

```powershell
.\portstorm.ps1 -ip_network "192.168.1." -ip_range (1..254) -port_range (80, 443, 22)
```
