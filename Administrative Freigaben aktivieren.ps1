Get-PSDrive -PSProvider Registry

$path = "HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\System" # registry key == registry folder
$registryValue = "LocalAccountTokenFilterPolicy" #registry value == entry of a key
$pathExists = Test-Path $path

If ($pathExists -eq $True) 
{
    Set-Location HKLM:\Software\Microsoft\Windows\CurrentVersion\Policies\System
    New-ItemProperty -Path . -Name "$registryValue" -PropertyType "DWord" -Value 1
    Write-Host "Added the new registry value to the registry key"
}
Else {
    Write-Host "No such registry key found"
}

