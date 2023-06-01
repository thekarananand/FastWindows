# Check for Admin Privileges

$Admin = ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")

if (-not $Admin) {
    Write-Host "Please run the script as an administrator."
    $null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
    Exit
}

# Removing All Store Apps

Get-AppxPackage | Remove-AppxPackage
Get-AppxPackage | Remove-AppxPackage

# Installing Winget

Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Force
Set-PSRepository -Name 'PSGallery' -InstallationPolicy Trusted
Install-Script -Name winget-install -Force
winget-install.ps1

# Bringing Back Essential Store Apps

Get-AppxPackage -allusers Microsoft.WindowsStore | Foreach {Add-AppxPackage -DisableDevelopmentMode -Register "$($_.InstallLocation)\AppXManifest.xml"}
Get-AppxPackage -allusers Microsoft.WindowsTerminal | Foreach {Add-AppxPackage -DisableDevelopmentMode -Register "$($_.InstallLocation)\AppXManifest.xml"}
Get-AppxPackage -allusers Microsoft.WindowsNotepad | Foreach {Add-AppxPackage -DisableDevelopmentMode -Register "$($_.InstallLocation)\AppXManifest.xml"}
Get-AppxPackage -allusers Microsoft.WindowsCalculator | Foreach {Add-AppxPackage -DisableDevelopmentMode -Register "$($_.InstallLocation)\AppXManifest.xml"}
Get-AppxPackage -allusers Microsoft.Windows.Photos | Foreach {Add-AppxPackage -DisableDevelopmentMode -Register "$($_.InstallLocation)\AppXManifest.xml"}
Get-AppxPackage -allusers Microsoft.ScreenSketch | Foreach {Add-AppxPackage -DisableDevelopmentMode -Register "$($_.InstallLocation)\AppXManifest.xml"}

# Installing new Apps

winget install Mozilla.Firefox --accept-source-agreements --accept-package-agreements
winget install Microsoft.WindowsTerminal --accept-source-agreements --accept-package-agreements

# Removing Preinstalled Apps

winget uninstall Microsoft.Teams

# Removing OneDrive

taskkill /f /im OneDrive.exe
%SystemRoot%\System32\OneDriveSetup.exe /uninstall
%SystemRoot%\SysWOW64\OneDriveSetup.exe /uninstall
winget uninstall Microsoft.OneDriveSync_8wekyb3d8bbwe
winget uninstall Microsoft.OneDrive
Remove-Item -Recurse -Force -ErrorAction SilentlyContinue "$env:localappdata\Microsoft\OneDrive"
Remove-Item -Recurse -Force -ErrorAction SilentlyContinue "$env:programdata\Microsoft OneDrive"
Remove-Item -Recurse -Force -ErrorAction SilentlyContinue "C:\OneDriveTemp"

# Removing Optional Components

dism /Online /Remove-Capability /NoRestart /CapabilityName:Microsoft.Windows.WordPad~~~~0.0.1.0
dism /Online /Remove-Capability /NoRestart /CapabilityName:Microsoft.Windows.PowerShell.ISE~~~~0.0.1.0
dism /Online /Remove-Capability /NoRestart /CapabilityName:Microsoft.Windows.Notepad.System~~~~0.0.1.0
dism /Online /Remove-Capability /NoRestart /CapabilityName:Media.WindowsMediaPlayer~~~~0.0.12.0
dism /Online /Remove-Capability /NoRestart /CapabilityName:Browser.InternetExplorer~~~~0.0.11.0
dism /Online /Remove-Capability /NoRestart /CapabilityName:App.StepsRecorder~~~~0.0.1.0

# Installing Useful Optional Components

dism /Online /Add-Capability /NoRestart /CapabilityName:App.WirelessDisplay.Connect~~~~0.0.1.0

# Registry Edits

If (!(Test-Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\AdvertisingInfo")) {
    New-Item "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\AdvertisingInfo"
} 
Set-ItemProperty "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\AdvertisingInfo" Enabled -Value 0

If (!(Test-Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Search")) {
    New-Item "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Search"
}
Set-ItemProperty "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Search" DisableWebSearch -Value 1

If (!(Test-Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize")) {
    New-Item "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize"
}
Set-ItemProperty "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize" AppsUseLightTheme 0

If (!(Test-Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize")) {
    New-Item "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize"
}
Set-ItemProperty "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize" SystemUsesLightTheme 0

If (!(Test-Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize")) {
    New-Item "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize"
}
Set-ItemProperty "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Feeds" ShellFeedsTaskbarViewMode 2

# Removing Unnecessary Shortcuts

Remove-Item $env:HOMEPATH\AppData\Roaming\Microsoft\Windows\Start` Menu\Programs\OneDrive.lnk
Remove-Item $env:HOMEPATH\AppData\Roaming\Microsoft\Windows\Start` Menu\Programs\Firefox` Private` Browsing.lnk
Remove-Item C:\ProgramData\Microsoft\Windows\Start` Menu\Programs\Firefox` Private` Browsing.lnk

Set-ExecutionPolicy -ExecutionPolicy Restricted -Force

Stop-Process -Name explorer -Force
