# New-VM.ps1
# Example PowerShell automation script for Windows Administration repository
# Author: Sana Rehman
# Purpose: Demonstrate automation and infrastructure setup for IT Tech Club

# Variables
$VMName = "LabVM01"
$VMSwitch = "Default Switch"
$VMMemory = 2GB
$VMPath = "$env:USERPROFILE\Documents\Hyper-V\$VMName"

# Create new VM
Write-Host "Creating VM named $VMName..." -ForegroundColor Cyan
New-VM -Name $VMName -MemoryStartupBytes $VMMemory -SwitchName $VMSwitch -Path $VMPath

# Configure VM
Set-VMProcessor -VMName $VMName -Count 2
Set-VMDvdDrive -VMName $VMName -Path "C:\ISOs\WindowsServer2019.iso"
Write-Host "VM configuration completed for $VMName" -ForegroundColor Green
al ability and creative application of AI in IT.