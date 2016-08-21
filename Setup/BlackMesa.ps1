# All Chocolatey Helpers:  https://github.com/chocolatey/choco/wiki/HelpersReference
# All Boxstarter Helpers: http://boxstarter.org/WinConfig

# Also: consider executing script: OpenPowerShellHereAsAdmin to add useful context menu item for opening powershell 

$is64bit = ($ENV:PROCESSOR_ARCHITECTURE -eq "AMD64")  # e.g.:  if ($is64bit) { cinst googlechrome-x64 -y } else { cinst googlechrome }

#Set Execution Policy (required elevated Powershell)
Set-ExecutionPolicy Unrestricted -Force

#Install PsGet: http://psget.net/
(new-object Net.WebClient).DownloadString("http://psget.net/GetPsGet.ps1") | iex

#Install Chocolatey: 
iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

#Install Boxstarter
cinst boxstarter -y

# Improve PowerShell
cinst powertab -y  # i think the downloaded module must be moved to the Powershell Modules folder manually
Install-Module PSReadline
Install-Module posh-git


#Windows Configuration with Boxstarter Commands

Set-WindowsExplorerOptions -EnableShowHiddenFilesFoldersDrives -EnableShowFileExtensions -EnableShowFullPathInTitleBar -DisableShowRecentFilesInQuickAccess -DisableShowFrequentFoldersInQuickAccess
# Set-WindowsExplorerOptions -EnableShowProtectedOSFiles
Enable-RemoteDesktop
Enable-MicrosoftUpdate
Disable-UAC
Disable-BingSearch
Disable-InternetExplorerESC
Disable-GameBarTips
Set-StartScreenOptions -EnableBootToDesktop -DisableShowAppsViewOnStartScreen -EnableListDesktopAppsFirst
Set-TaskbarOptions -Combine Never

#Show all Tray Icons
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer" /v EnableAutoTray /t REG_DWORD /d 0 /f

# Disable Application Grouping
# Set-TaskbarOptions -Combine Never is probably doing the same ...
# Set-ItemProperty -Path HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced -Name TaskbarGlomLevel -Value 2  # 0 is Always Grouping | 1 is Grouping only when Taskbar is full | 2 is Never Group

# Restart Explorer to update registry changes - Explorer will restart by itself by default, so we just need to stop it.
Get-Process -Name explorer | Stop-Process


# Install Windows Updates

# Update Windows (afaik auto reboot is included)
Install-WindowsUpdate -AcceptEula


# Libraries, Frameworks & Co

cinst flashplayerplugin -y
cinst javaruntime -y
cinst silverlight -y
cinst dotnet3.5 -y
cinst dotnet4.5 -y
cinst vcredist2010 -y # C++ Libraries

# Dev Tools

cinst visualstudio2015community -y
cinst visualstudiocode -y
cinst nodejs -y
cinst ruby
cinst python


# Browsers

cinst google-chrome-x64 -y
cinst firefox -y
cinst adblockpluschrome -y


# Other

cinst foxitreader -y
cinst owncloud-client -y
cinst sourcetree -y
cinst 7zip.install -y
cinst chocolateygui -y
cinst skype -y
cinst putty -y
cinst notepadplusplus -y
cinst vlc -y


# cinst winmerge -y # vscode offers a very good file diff feature
# cinst paint.net -y
# cinst sysinternals -y # portable-available
# cinst notepadplusplus.install -y #.install suffix is a discoverability artefact - notepadplusplus.install is the same package as notepadplusplus
# cinst powershell -y # Install newest powershell version (V5 is already included in Win10)
# cinst conemu -y
# cinst windirstat -y # portable-available
# cinst teamviewer -y
# cinst sublimetext3 -y # portable-available
# cinst teracopy -y
# cinst kav -y # Kaspersky Anti Virus
# cinst procexp -y #Process Explorer - portable available
# cinst fiddler4 -y # - portable available
# cinst mssqlserver2012express -y
# cinst git-credential-winstore -y
# cinst poshgit -y already installed via PsGet
# cinst windbg -y

# Windows Features

cinst Microsoft-Hyper-V-All -source windowsFeatures -y
cinst IIS-WebServerRole -source windowsfeatures -y
cinst IIS-HttpCompressionDynamic -source windowsfeatures -y
cinst TelnetClient -source windowsFeatures -y


# Creates an item in the task bar linking to the provided path
Install-ChocolateyPinnedTaskBarItem "$env:windir\system32\mstsc.exe"
Install-ChocolateyPinnedTaskBarItem "$env:programfiles\console\console.exe"


# Create File Associations
# Install-ChocolateyFileAssociation `
#   -Extension <String> `
#   -Executable <String> `
#   [-IgnoredArguments <Object[]>] [<CommonParameters>]


# Creates shortcuts
Install-ChocolateyShortcut -ShortcutFilePath "C:\test.lnk" -TargetPath "C:\test.exe"

Install-ChocolateyShortcut `
  -ShortcutFilePath "C:\notepad.lnk" `
  -TargetPath "C:\Windows\System32\notepad.exe" `
  -WindowStyle 3 `
  -RunAsAdmin `
  -PinToTaskbar