function Get-DnsServerOfEthernet3 {
    $interfaceName = "Ethernet 3"
    
    $dnsServers = (Get-DnsClientServerAddress -InterfaceAlias $interfaceName).ServerAddresses
    
    Write-Host "DNS servers for $interfaceName"
    $dnsServers | ForEach-Object { Write-Host "  $_" }
}

Get-DnsServerOfEthernet3

Test-NetConnection malware.testcategory.com HTTP

Install-Module -Name PSScriptAnalyzer

Import-Module PSScriptAnalyzer

Invoke-ScriptAnalyzer -Path "C:\Users\vagrant\Desktop"

Set-DnsClientServerAddress -InterfaceAlias "Ethernet 3" -ServerAddresses ("1.1.1.2", "1.0.0.2")

$guid = "your_interface_guid_here"  
$registryPath = "HKLM:\System\CurrentControlSet\Services\Dnscache\InterfaceSpecificParameters\$guid\DohInterfaceSettings\Doh\1.1.1.2"
New-Item -Path $registryPath -Force

$guid = "your_interface_guid_here" 
$registryPath = "HKLM:\System\CurrentControlSet\Services\Dnscache\InterfaceSpecificParameters\$guid\DohInterfaceSettings\Doh\1.1.1.2"
$dohFlagsValue = 1

Set-ItemProperty -Path $registryPath -Name "DohFlags" -Value $dohFlagsValue

$interfaceName = "Ethernet 3"
$interface = Get-NetAdapter | Where-Object { $_.Name -eq $interfaceName }
$guid = $interface.InterfaceGuid

$registryPath = "HKLM:\System\CurrentControlSet\Services\Dnscache\InterfaceSpecificParameters\$guid\DohInterfaceSettings\Doh\1.1.1.2"

New-Item -Path $registryPath -Force

$registryPath = "HKLM:\System\CurrentControlSet\Services\Dnscache\InterfaceSpecificParameters\$guid\DohInterfaceSettings\Doh\1.1.1.2"
$dohFlagsValue = 1
Set-ItemProperty -Path $registryPath -Name "DohFlags" -Value $dohFlagsValue

function Reset-DnsServer {
    param (
        [string]$interfaceName,
        [string]$originalDnsServer
    )
    
    $originalDnsServers = @($originalDnsServer)

    Write-Host "Resetting DNS servers for $interfaceName to original value..."
    Set-DnsClientServerAddress -InterfaceAlias $interfaceName -ServerAddresses $originalDnsServers
    Write-Host "DNS servers for $interfaceName have been reset to original value."
}

$interfaceName = "Ethernet 3"
$originalDnsServer = "10.0.2.3"
Reset-DnsServer -interfaceName $interfaceName -originalDnsServer $originalDnsServer


