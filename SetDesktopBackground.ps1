#Set-ItemProperty 'HKU:\.DEFAULT\Control Panel\Desktop' -Name Wallpaper -Value ""
Set-ItemProperty 'HKCU:\Control Panel\Desktop' -Name Wallpaper -Value ""

#Set-ItemProperty 'HKUS:\.DEFAULT\Control Panel\Colors' -Name Background -Value "116 164 2"
Set-ItemProperty 'HKCU:\Control Panel\Colors' -Name Background -Value "116 164 2"


Set-ItemProperty 'HKCU:\Control Panel\Desktop' -Name ImageColor -Value "c4ffffff"



# Restart Explorer to update registry changes - Explorer will restart by itself by default, so we just need to stop it.
Get-Process -Name explorer | Stop-Process