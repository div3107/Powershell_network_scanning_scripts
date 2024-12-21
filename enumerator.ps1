# ---------------------- ENUMERATION SCRIPT ------------------------
# --------- Local Enumeration for: $env:COMPUTERNAME --------------
# ------------------------------------------------------------------
Write-Host "Script Author: Lostboy" -ForegroundColor DarkCyan
Write-Host "Starting Local Host Enumeration for: $env:COMPUTERNAME" -ForegroundColor Green

# System Information
Write-Host "`n--------------------- System Information ---------------------" -ForegroundColor Cyan
Get-ComputerInfo | Select-Object CsName, WindowsVersion, OsArchitecture, InstallDate, WindowsCurrentVersion, BiosName, BiosVersion, BiosSerialNumber | Format-List

# Installed Software
Write-Host "`n--------------------- Installed Software ---------------------" -ForegroundColor Cyan
Get-CimInstance -ClassName Win32_Product | Select-Object Name, Version, Vendor, InstallDate | Sort-Object Name | Format-Table -AutoSize

# Installed Antivirus
Write-Host "`n--------------------- Installed Antivirus ---------------------" -ForegroundColor Cyan
Try {
    Get-CimInstance -Namespace root/SecurityCenter2 -ClassName AntiVirusProduct | Select-Object DisplayName, ProductState, PathToSignedProductExe | Format-Table -AutoSize
} Catch {
    Write-Host "Unable to retrieve antivirus information. Ensure the script runs with proper privileges." -ForegroundColor Red
}

# Windows Defender Information
Write-Host "`n--------------------- Windows Defender Info ---------------------" -ForegroundColor Cyan
Try {
    Get-MpComputerStatus | Select-Object RealTimeProtectionEnabled, AntivirusSignatureLastUpdated, IsTamperProtected | Format-List
} Catch {
    Write-Host "Unable to retrieve Windows Defender information. Ensure the script runs with proper privileges." -ForegroundColor Red
}

# User and Group Information
Write-Host "`n--------------------- User and Group Information ---------------------" -ForegroundColor Cyan
Write-Host "`nLocal Users:" -ForegroundColor Yellow
net users | Out-String

Write-Host "`nLocal Groups:" -ForegroundColor Yellow
net localgroup | Out-String

# Network Information
Write-Host "`n--------------------- Network Information ---------------------" -ForegroundColor Cyan
Get-NetIPAddress | Where-Object { $_.AddressState -eq "Preferred" } | Select-Object InterfaceAlias, IPAddress | Format-Table -AutoSize

Write-Host "`nActive TCP Connections:" -ForegroundColor Yellow
Get-NetTCPConnection | Select-Object LocalAddress, LocalPort, RemoteAddress, RemotePort, State | Format-Table -AutoSize

# Disk Information
Write-Host "`n--------------------- Disk Information ---------------------" -ForegroundColor Cyan
Get-PSDrive -PSProvider FileSystem | Select-Object Name, @{Name="Used(GB)";Expression={[math]::round($_.Used / 1GB, 2)}}, @{Name="Free(GB)";Expression={[math]::round($_.Free / 1GB, 2)}}, @{Name="Total(GB)";Expression={[math]::round($_.Used / 1GB + $_.Free / 1GB, 2)}} | Format-Table -AutoSize

# Final Message
Write-Host "`n--------------------- !!!!! DONE !!!!! ---------------------" -ForegroundColor Green
