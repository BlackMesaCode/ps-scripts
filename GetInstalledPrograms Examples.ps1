. "$PSScriptRoot\GetInstalledPrograms.ps1"

$pathToSetupFiles =  $PSScriptRoot + "\Setups"

#Firewall
#netsh advfirewall import "C:\#install\schema\FirewallRichtlinien.wfw"

#Energy Options
#powercfg /import C:\#install\schema\Jerg.pow 12345678-1234-1234-1234-123456789123
#timeout /t 2
#powercfg /s 12345678-1234-1234-1234-123456789123

# Alternative to $PSScriptRoot
#$scriptpath = split-path -parent $MyInvocation.MyCommand.Definition

$isAdobeFlashInstalled = (Get-InstalledPrograms | where DisplayName -Match 'Adobe Flash' | Measure-Object).Count -gt 0
$isJavaInstalled = (Get-InstalledPrograms | where DisplayName -Match 'Java' | Measure-Object).Count -gt 0
$isAdobeReaderInstalled = (Get-InstalledPrograms | where DisplayName -Match 'Adobe Reader' | Measure-Object).Count -gt 0
$isAdobeReaderInstalled = (Get-InstalledPrograms | where DisplayName -Match 'Adobe Reader' | Measure-Object).Count -gt 0


if ($isJavaInstalled) {
    &($pathToSetupFiles + "\Java.exe /s")
}