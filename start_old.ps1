# Check for Admin Privileges

$Admin = ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")

if (-not $Admin) {
    Write-Host "Please run the script as an administrator."
    $null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
    Exit
}

# Remove Appx Packages apps 
irm https://raw.githubusercontent.com/thekarananand/FastWindows/main/Stage1_RemoveAppxPackages.ps1 | iex

# Remove Win32 apps 
irm https://raw.githubusercontent.com/thekarananand/FastWindows/main/Stage2_RemoveWin32Apps.ps1 | iex

# Install New Apps 
irm https://raw.githubusercontent.com/thekarananand/FastWindows/main/Stage3_InstallNewApps.ps1 | iex


# Installing Winget

# Install-PackageProvider -Name NuGet -MinimumVersion 2.8.5.201 -Force
# Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Force
# Set-PSRepository -Name 'PSGallery' -InstallationPolicy Trusted
# Install-Script -Name winget-install -Force
# winget-install.ps1
# Set-ExecutionPolicy -ExecutionPolicy Restricted -Force




# Installing new Apps

winget install Mozilla.Firefox --accept-source-agreements --accept-package-agreements
winget install Microsoft.WindowsTerminal --accept-source-agreements --accept-package-agreements
winget install VideoLAN.VLC --accept-source-agreements --accept-package-agreements


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

# Disable Windows Search history
if (!(Test-Path -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Search")) {
    New-Item -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Search" -Force | Out-Null
}
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Search" -Name "SearchHistoryEnabled" -Value 0
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Search" -Name "CortanaConsent" -Value 0

# Disable Windows Web Search

If (!(Test-Path -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Search")) {
    New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Search" -Force
}
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Search" -Name "DisableWebSearch" -Value 1
New-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Search" -Name "ConnectedSearchUseWebOverMeteredConnections" -Value 0 -Prope
New-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Search" -Name "AllowCortana" -Value 0 -PropertyType DWORD -Force | Out-Null
New-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Search" -Name "DisableWebSearch" -Value 1 -PropertyType DWORD -Force | Out-Null
New-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Search" -Name "ConnectedSearchUseWeb" -Value 0 -PropertyType DWORD -Force | Out-Null


# Disable Bing Search in Windows Web Search

if (!(Test-Path -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Search")) {
    New-Item -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Search" -Force
}
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Search" -Name "BingSearchEnabled" -Value 0
New-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Search" -Name "AllowSearchToUseLocation" -Value 0 -PropertyType DWORD -Force | Out-Null

# Disable Dynamic Search Box
if (!(Test-Path -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\SearchSettings")) {
    New-Item -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\SearchSettings" -Force
}
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\SearchSettings" -Name "IsDynamicSearchBoxEnabled" -Value 0

# Remove Teams bubble chat
if (!(Test-Path -Path "HKCU:\Software\Policies\Microsoft\Office\Teams")) {
    New-Item -Path "HKCU:\Software\Policies\Microsoft\Office\Teams" -Force | Out-Null
}
Set-ItemProperty -Path "HKCU:\Software\Policies\Microsoft\Office\Teams" -Name "ChatButtonVisibility" -Value 0

if (!(Test-Path -Path "HKCU:\Software\Microsoft\Office\Teams\LivePreview")) {
    New-Item -Path "HKCU:\Software\Microsoft\Office\Teams\LivePreview" -Force | Out-Null
}
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Office\Teams\LivePreview" -Name "Enabled" -Value 0

if (!(Test-Path -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced")) {
    New-Item -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Force | Out-Null
}
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "TaskbarMn" -Value 0

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

# Disable Timeline in Windows Multitacking
if (!(Test-Path -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\System")) {
    New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\System" -Force
}
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\System" -Name "EnableActivityFeed" -Type DWord -Value 0

# Disable User Activity History 
if (!(Test-Path -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\System")) {
    New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\System" -Force
}
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\System" -Name "PublishUserActivities" -Type DWord -Value 0

# Disable User Activity History to Upload
if (!(Test-Path -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\System")) {
    New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\System" -Force
}
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\System" -Name "UploadUserActivities" -Type DWord -Value 0

# Disble Hibernatio
if (!(Test-Path -Path "HKLM:\System\CurrentControlSet\Control\Session Manager\Power")) {
    New-Item -Path "HKLM:\System\CurrentControlSet\Control\Session Manager\Power" -Force
}
Set-ItemProperty -Path "HKLM:\System\CurrentControlSet\Control\Session Manager\Power" -Name "HibernateEnabled" -Type DWord -Value 0

# Hide Hibernation Option
if (!(Test-Path -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FlyoutMenuSettings")) {
    New-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FlyoutMenuSettings" -Force
}
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\FlyoutMenuSettings" -Name "ShowHibernateOption" -Type DWord -Value 0

# Restricts Location Services
if (!(Test-Path -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\location")) {
    New-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\location" -Force
}
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\location" -Name "Value" -Type String -Value "Deny"

# Denying Sensor Permissions
if (!(Test-Path -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Sensor\Overrides\{BFA794E4-F964-4FDB-90F6-51056BFE4B44}")) {
    New-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Sensor\Overrides\{BFA794E4-F964-4FDB-90F6-51056BFE4B44}" -Force
}
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Sensor\Overrides\{BFA794E4-F964-4FDB-90F6-51056BFE4B44}" -Name "SensorPermissionState" -Type DWord -Value 0

# Denying Geographic Loaction Services
if (!(Test-Path -Path "HKLM:\SYSTEM\CurrentControlSet\Services\lfsvc\Service\Configuration")) {
    New-Item -Path "HKLM:\SYSTEM\CurrentControlSet\Services\lfsvc\Service\Configuration" -Force
}
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\lfsvc\Service\Configuration" -Name "Status" -Type DWord -Value 0

# Don't Update Maps
if (!(Test-Path -Path "HKLM:\SYSTEM\Maps")) {
    New-Item -Path "HKLM:\SYSTEM\Maps" -Force
}
Set-ItemProperty -Path "HKLM:\SYSTEM\Maps" -Name "AutoUpdateEnabled" -Type DWord -Value 0

# Show File Extensions
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "HideFileExt" -Value 0
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "Hidden" -Value 1

# Disable News & Feed
if (!(Test-Path -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Feeds")) {
    New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Feeds" -Force
}
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Feeds" -Name "EnableFeeds" -Value 0

irm https://raw.githubusercontent.com/thekarananand/FastWindows/main/newscript.ps1 | iex

#-------------------------------------------------------------



# Servies 


irm https://raw.githubusercontent.com/thekarananand/FastWindows/main/service.ps1 | iex

# Dev

winget install Git.Git --accept-source-agreements --accept-package-agreements
winget install GitHub.cli --accept-source-agreements --accept-package-agreements
winget install Microsoft.VisualStudioCode --accept-source-agreements --accept-package-agreements



echo "DONE........"
Pause

Exit