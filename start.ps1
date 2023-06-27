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

Install-PackageProvider -Name NuGet -MinimumVersion 2.8.5.201 -Force
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

# Disable Advertising ID

If (!(Test-Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\AdvertisingInfo")) {
    New-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\AdvertisingInfo" -Force
} 
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\AdvertisingInfo" -Name Enabled -Value 0

# Disable Windows Web Search

If (!(Test-Path -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Search")) {
    New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Search" -Force
}
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Search" -Name "DisableWebSearch" -Value 1

# Disable Bing Search in Windows Web Search

if (!(Test-Path -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Search")) {
    New-Item -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Search" -Force
}
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Search" -Name "BingSearchEnabled" -Value 0

# Enable Dark Theme for Apps

If (!(Test-Path -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize")) {
    New-Item -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize" -Force
}
Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize" -Name "AppsUseLightTheme" -Value 0

# Enable Dark Theme for System

If (!(Test-Path -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize")) {
    New-Item -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize" -Force
-Value }
Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize" -Name "SystemUsesLightTheme" -Value 0

# News Feed Shit

If (!(Test-Path -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize")) {
    New-Item -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize" -Force
}
Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Feeds" -Name "ShellFeedsTaskbarViewMode" -Value 2

# Disable Telemetry & Diagnostic data

if (!(Test-Path -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection")) {
    New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection" -Force
}
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection" -Name "AllowTelemetry" -Value 0

# Disable Find my device

if (!(Test-Path -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\SettingSync")) {
    New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\SettingSync" -Force
}
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\SettingSync" -Name "DisableSettingSyncUserOverride" -Value 1

# Disable Inking & typing personalization

if (!(Test-Path -Path "HKCU:\Software\Microsoft\InputPersonalization")) {
    New-Item -Path "HKCU:\Software\Microsoft\InputPersonalization" -Force
}
Set-ItemProperty -Path "HKCU:\Software\Microsoft\InputPersonalization" -Name "RestrictImplicitInkCollection" -Value 1

# Disable Tailored Experiences

if (!(Test-Path -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Privacy")) {
    New-Item -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Privacy" -Force
}
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Privacy" -Name "TailoredExperiencesWithDiagnosticDataEnabled" -Value 0

# Disable Location

if (!(Test-Path -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Privacy")) {
    New-Item -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Privacy" -Force
}
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Privacy" -Name "LocationEnabled" -Value 0


# Removing Unnecessary Shortcuts

Remove-Item $env:HOMEPATH\AppData\Roaming\Microsoft\Windows\Start` Menu\Programs\OneDrive.lnk
Remove-Item $env:HOMEPATH\AppData\Roaming\Microsoft\Windows\Start` Menu\Programs\Firefox` Private` Browsing.lnk
Remove-Item C:\ProgramData\Microsoft\Windows\Start` Menu\Programs\Firefox` Private` Browsing.lnk

Set-ExecutionPolicy -ExecutionPolicy Restricted -Force

Stop-Process -Name explorer -Force

Exit