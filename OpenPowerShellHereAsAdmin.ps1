$menu = 'Open Windows PowerShell Here as Administrator'
$command = "$PSHOME\powershell.exe -NoExit -Command ""Set-Location '%V'""" # -NoProfile
 
'directory', 'directory\background', 'drive' | ForEach-Object {
    New-Item -Path "Registry::HKEY_CLASSES_ROOT\$_\shell" -Name runas\command -Force |
    Set-ItemProperty -Name '(default)' -Value $command -PassThru |
    Set-ItemProperty -Path {$_.PSParentPath} -Name '(default)' -Value $menu -PassThru |
    Set-ItemProperty -Name HasLUAShield -Value ''
}

# Hint:  Toggle the powershell.exe  -NoProfile switch to get your profile loaded automatically when you launch the prompt or not