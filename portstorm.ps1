# ------------------------ Asynchronous Port Scanner ---------------------
# ------------------------ Created by Lostboy ----------------------------
# This script performs a fast scan of a specified IP and port range,
# identifying open ports on each host.
# ------------------------------------------------------------------------

param(
    [int[]]$port_range,         # Ports to scan, e.g., 20..1024
    [string]$ip_network,        # Network, e.g., "192.168.1."
    [int[]]$ip_range            # Host IDs to scan, e.g., 1..254
)

Write-Host "Script Author: Lostboy" -ForegroundColor DarkCyan
Write-Host "For example: .\portstorm.ps1 -ip_network 192.168.29. -ip_range(1..15) -port_range 53,80,443" -ForegroundColor DarkCyan
# Display banner
Write-Host "Starting Optimized Port Scan..." -ForegroundColor Green
Write-Host "Network: $ip_network"
Write-Host "Hosts: $($ip_range -join ', ')"
Write-Host "Ports: $($port_range -join ', ')"
Write-Host "------------------------------------------------------------"

# Function: Test if a port is open with a shorter timeout
function Test-Port {
    param(
        [string]$ip,
        [int]$port
    )
    try {
        # Create a new TCP client with a short timeout
        $tcpClient = New-Object System.Net.Sockets.TcpClient
        $asyncResult = $tcpClient.BeginConnect($ip, $port, $null, $null)
        $waitHandle = $asyncResult.AsyncWaitHandle
        if ($waitHandle.WaitOne(200, $false)) {  # 200ms timeout
            $tcpClient.EndConnect($asyncResult)
            $tcpClient.Close()
            return $true
        } else {
            $tcpClient.Close()
            return $false
        }
    } catch {
        return $false
    }
}

# Iterate through the IP range
foreach ($host_id in $ip_range) {
    $current_ip = "$ip_network$host_id"  # Construct full IP address
    Write-Host "Scanning Host: $current_ip" -ForegroundColor Cyan

    # Iterate through the port range
    foreach ($port in $port_range) {
        if (Test-Port -ip $current_ip -port $port) {
            Write-Host "Port $port is OPEN on $current_ip" -ForegroundColor Yellow
        }
    }
}

# Completion message
Write-Host "------------------------------------------------------------"
Write-Host "Port Scan Completed." -ForegroundColor Green

# ------------------------------------------------------------------------
# Script Author: Lostboy
# Purpose: Efficiently identify open ports on a given IP and port range.
# Created for Red Teaming and fast network reconnaissance.
# ------------------------------------------------------------------------
