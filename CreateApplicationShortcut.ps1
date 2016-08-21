## Install-ChocolateyShortcut might be cleaner to use !!


# Safely Remove Hardware
$AppLocation = "C:\Windows\System32\rundll32.exe"
$WshShell = New-Object -ComObject WScript.Shell
$Shortcut = $WshShell.CreateShortcut("$Home\Desktop\USB Hardware.lnk")
$Shortcut.TargetPath = $AppLocation
$Shortcut.Arguments ="shell32.dll,Control_RunDLL hotplug.dll"
$Shortcut.IconLocation = "hotplug.dll,0"
$Shortcut.Description ="Device Removal"
$Shortcut.WorkingDirectory ="C:\Windows\System32"
$Shortcut.Save()


# Create a Desktop Shortcut to the Computer / Windows Explorer
$WshShell = New-Object -ComObject WScript.Shell
$Shortcut = $WshShell.CreateShortcut("$Home\Desktop\Computer.lnk")
$Shortcut.TargetPath = ""  # The TargetPath for Computer is just ""
$Shortcut.Save()

# Create a Desktop Shortcut to the Powershell
$WshShell = New-Object -ComObject WScript.Shell
$Shortcut = $WshShell.CreateShortcut("$Home\Desktop\Poweshell.lnk")
$Shortcut.TargetPath = "%windir%\System32\WindowsPowerShell\v1.0\powershell.exe"
$Shortcut.Save()


# Create a Desktop Shortcut to the Powershell ISE
$WshShell = New-Object -ComObject WScript.Shell
$Shortcut = $WshShell.CreateShortcut("$Home\Desktop\Poweshell ISE.lnk")
$Shortcut.TargetPath = "%windir%\System32\WindowsPowerShell\v1.0\powershell_ise.exe"
$Shortcut.Save()
