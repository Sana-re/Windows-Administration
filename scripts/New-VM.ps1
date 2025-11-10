<#
.SYNOPSIS
    Example PowerShell automation script for Windows Administration repository.
.DESCRIPTION
    Automates the creation and configuration of a Hyper-V virtual machine.
    Demonstrates automation and infrastructure setup for IT Tech Club.
.AUTHOR
    Sana Rehman
.DATE
    2025-11-10
#>

# -------------------- CONFIGURATION VARIABLES --------------------
$VMName   = "LabVM01"
$VMSwitch = "Default Switch"
$VMMemory = 2GB
$VMPath   = "$env:USERPROFILE\Documents\Hyper-V\$VMName"
$ISOPath  = "C:\Users\sanar\OneDrive\Desktop\Trios\ISO\en-us_windows_server_2019_x64_dvd_f9475476.iso"

# -------------------- VM CREATION --------------------
Write-Host "Creating VM named $VMName..." -ForegroundColor Cyan
New-VM -Name $VMName -MemoryStartupBytes $VMMemory -SwitchName $VMSwitch -Path $VMPath | Out-Null

# -------------------- VM CONFIGURATION --------------------
Set-VMProcessor -VMName $VMName -Count 2

if (Test-Path $ISOPath) {
    Set-VMDvdDrive -VMName $VMName -Path $ISOPath
} else {
    Write-Warning "ISO file not found at $ISOPath. Skipping DVD attachment."
}

# Enable automatic checkpoints for new VMs
Set-VM -Name $VMName -AutomaticCheckpointsEnabled $true

# -------------------- OUTPUT --------------------
Write-Host "`nVM configuration completed for $VMName" -ForegroundColor Green
Get-VM -Name $VMName | Select Name, State, MemoryAssigned, Uptime, Version

