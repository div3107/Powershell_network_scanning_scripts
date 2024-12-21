# ------------------------ IP Range Scanner ------------------------
# ------------------- Created by Lostboy ---------------------------
# This script scans a specified IP range in a given network and
# displays the status of each host (Online/Offline).
# ------------------------------------------------------------------

# Parameters: 
# $ip_network - The subnet to scan (e.g., "192.168.1.")
# $ip_range   - The range of host IDs to scan (e.g., 1..254)
param(
    [string]$ip_network,      # Subnet, e.g., "192.168.1."
    [int[]]$ip_range          # Host IDs, e.g., 1..254
)
Write-Host "Script Author: Lostboy" -ForegroundColor DarkCyan
Write-Host "For example: .\netdiscovery.ps1 -ip_network 192.168.1 -ip_range(1..255)" -ForegroundColor DarkCyan
# Create a new Ping object
# This object is used to send ICMP ping requests to the specified hosts.
$ping = New-Object System.Net.NetworkInformation.Ping

# Display a banner to indicate the start of the scan
Write-Host "Starting IP Range Scan..." -ForegroundColor Green
Write-Host "Network: $ip_network"
Write-Host "Range: $($ip_range -join ', ')"
Write-Host "------------------------------------------------------------"

# Iterate through the provided IP range
# For each IP, perform a ping test and display the result
$ip_range | ForEach-Object {
    $ip = "$ip_network$_"       # Combine subnet with host ID to form full IP
    $result = $ping.Send($ip, 1000)  # Send ping request with a 1000ms timeout
    if ($result.Status -eq "Success") {
        # Host is online
        Write-Host "Host $ip is Online" -ForegroundColor Yellow
    } else {
        # Host is offline
        Write-Host "Host $ip is Offline" -ForegroundColor DarkGray
    }
}

# Display a completion message
Write-Host "------------------------------------------------------------"
Write-Host "Scan Completed." -ForegroundColor Green

# ------------------------------------------------------------------
# Script Author: Lostboy
# Purpose: Quickly scan a range of IP addresses in a given subnet.
# Created by Lostboy for efficient network troubleshooting and Red teaming.
# ------------------------------------------------------------------
