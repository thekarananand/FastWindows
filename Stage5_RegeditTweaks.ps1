Write-Host "`nStage 5 : REGEDIT TWEAKS"
Write-Host "========================================================="

#----------------------------------------------------------------------------------------------------
# Disabling Sponsored Apps in Start

$ContentDeliveryManagerTweaks_SetZero = @(
    "ContentDeliveryAllowed",
    "FeatureManagementEnabled",
    "OemPreInstalledAppsEnabled",
    "PreInstalledAppsEnabled",
    "PreInstalledAppsEverEnabled",
    "RotatingLockScreenEnabled",
    "SlideshowEnabled",
    "SoftLandingEnabled",
    "SubscribedContentEnabled"
)

if (!(Test-Path -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager")) {
    New-Item -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -Force | Out-Null
}

foreach ($Tweak in $ContentDeliveryManagerTweaks_SetZero) {
    New-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -Name $Tweak -Value 0 -Type DWord -Force | Out-Null
}

if (!(Test-Path -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\CloudContent")) {
    New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\CloudContent" -Force | Out-Null
}
New-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\CloudContent" -Name 'DisableWindowsConsumerFeatures' -Value 1 -Type DWord -Force | Out-Null

if (!(Test-Path -Path "HKLM:\SOFTWARE\Microsoft\PolicyManager\current\device\Start")) {
    New-Item -Path "HKLM:\SOFTWARE\Microsoft\PolicyManager\current\device\Start" -Force | Out-Null
}
New-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\PolicyManager\current\device\Start" -Name 'ConfigureStartPins' -Value '{"pinnedList": [{}]}' -Type String -Force | Out-Null

Write-Host "Disabled  : Sponsored Apps in Start"

#----------------------------------------------------------------------------------------------------
# Disabling Stupid Behaviour of Windows Search


$CurrentVerison_Search_SetZero = @(
    "SearchHistoryEnabled",
    "CortanaConsent",
    "BingSearchEnabled",
    "AllowSearchToUseLocation",
    "SearchboxTaskbarMode"
)

if (!(Test-Path -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Search")) {
    New-Item -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Search" -Force | Out-Null
}

foreach ($Tweak in $CurrentVerison_Search_SetZero) {
    New-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Search" -Name $Tweak -Value 0 -Type DWord -Force | Out-Null
}


$Windows_Search_SetZero = @(
    "ConnectedSearchUseWebOverMeteredConnections"
    "AllowCortana"
    "ConnectedSearchUseWeb"
)

if (!(Test-Path -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Search")) {
    New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Search" -Force | Out-Null
}

foreach ($Tweak in $Windows_Search_SetZero) {
    New-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Search" -Name $Tweak -Value 0 -Type DWord -Force | Out-Null
}

New-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Search" -Name "DisableWebSearch" -Value 1 -PropertyType DWORD -Force | Out-Null

if (!(Test-Path -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\SearchSettings")) {
    New-Item -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\SearchSettings" -Force  | Out-Null
}
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\SearchSettings" -Name "IsDynamicSearchBoxEnabled" -Value 0 | Out-Null

Write-Host "Disabled  : Windows Search History"
Write-Host "Disabled  : Bing/Web Search in Windows Search"
Write-Host "Disabled  : Dynamic Search Highlights"
Write-Host "Enabled   : Hidden Search Bar"

#---------------------------------------------------------------------------------------
# Disable Advertising ID

If (!(Test-Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\AdvertisingInfo")) {
    New-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\AdvertisingInfo" -Force | Out-Null
} 
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\AdvertisingInfo" -Name Enabled -Value 0 | Out-Null

Write-Host "Disabled  : Advertising ID"

#---------------------------------------------------------------------------------------
# Disable Teams bubble chat

if (!(Test-Path -Path "HKCU:\Software\Policies\Microsoft\Office\Teams")) {
    New-Item -Path "HKCU:\Software\Policies\Microsoft\Office\Teams" -Force | Out-Null
}
Set-ItemProperty -Path "HKCU:\Software\Policies\Microsoft\Office\Teams" -Name "ChatButtonVisibility" -Value 0 | Out-Null

if (!(Test-Path -Path "HKCU:\Software\Microsoft\Office\Teams\LivePreview")) {
    New-Item -Path "HKCU:\Software\Microsoft\Office\Teams\LivePreview" -Force | Out-Null
}
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Office\Teams\LivePreview" -Name "Enabled" -Value 0 | Out-Null

if (!(Test-Path -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced")) {
    New-Item -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Force | Out-Null
}
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "TaskbarMn" -Value 0 | Out-Null

Write-Host "Disabled  : Teams Bubble Chat"

#---------------------------------------------------------------------------------------
# Enable Dark Theme for Apps
If (!(Test-Path -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize")) {
    New-Item -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize" -Force | Out-Null
}
Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize" -Name "AppsUseLightTheme" -Value 0 | Out-Null
Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize" -Name "SystemUsesLightTheme" -Value 0 | Out-Null
Set-ItemProperty -Path 'HKCU:\Control Panel\Desktop' -Name Wallpaper -Value 'C:\Windows\Web\4K\Wallpaper\Windows\img19_1920x1200.jpg'

Rundll32.exe user32.dll, UpdatePerUserSystemParameters

taskkill /f /im explorer.exe
start explorer.exe

Write-Host "Enabled   : Dark Mode"

#---------------------------------------------------------------------------------------
# Disable the News & Feed
If (!(Test-Path -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize")) {
    New-Item -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize" -Force | Out-Null
}
Set-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Feeds" -Name "ShellFeedsTaskbarViewMode" -Value 2 | Out-Null

if (!(Test-Path -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Feeds")) {
    New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Feeds" -Force
}
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Feeds" -Name "EnableFeeds" -Value 0

Write-Host "Disabled  : News & Feed"

#---------------------------------------------------------------------------------------
# Disable Telemetry & Diagnostic data
if (!(Test-Path -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection")) {
    New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection" -Force | Out-Null
}
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection" -Name "AllowTelemetry" -Value 0 | Out-Null

Write-Host "Disabled  : Telemetry & Diagnostic data"

#---------------------------------------------------------------------------------------
# Disable Find my device
if (!(Test-Path -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\SettingSync")) {
    New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\SettingSync" -Force | Out-Null
}
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\SettingSync" -Name "DisableSettingSyncUserOverride" -Value 1 | Out-Null

Write-Host "Disabled  : Find my device"

#---------------------------------------------------------------------------------------
# Disable Inking & typing personalization
if (!(Test-Path -Path "HKCU:\Software\Microsoft\InputPersonalization")) {
    New-Item -Path "HKCU:\Software\Microsoft\InputPersonalization" -Force | Out-Null
}
Set-ItemProperty -Path "HKCU:\Software\Microsoft\InputPersonalization" -Name "RestrictImplicitInkCollection" -Value 1 | Out-Null

Write-Host "Disabled  : Inking & typing personalization"

#---------------------------------------------------------------------------------------
# Disable Tailored Experiences
if (!(Test-Path -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Privacy")) {
    New-Item -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Privacy" -Force | Out-Null
}
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Privacy" -Name "TailoredExperiencesWithDiagnosticDataEnabled" -Value 0 | Out-Null

Write-Host "Disabled  : Tailored Experiences"

#---------------------------------------------------------------------------------------
# Disable Location Tracking
if (!(Test-Path -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Privacy")) {
    New-Item -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Privacy" -Force | Out-Null
}
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Privacy" -Name "LocationEnabled" -Value 0 | Out-Null

# Restricts Location Services
if (!(Test-Path -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\location")) {
    New-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\location" -Force
}
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\location" -Name "Value" -Type String -Value "Deny"

# Denying Geographic Loaction Services
if (!(Test-Path -Path "HKLM:\SYSTEM\CurrentControlSet\Services\lfsvc\Service\Configuration")) {
    New-Item -Path "HKLM:\SYSTEM\CurrentControlSet\Services\lfsvc\Service\Configuration" -Force
}
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\lfsvc\Service\Configuration" -Name "Status" -Type DWord -Value 0

Write-Host "Disabled  : Location Services"

#---------------------------------------------------------------------------------------
# Disable Timeline in Windows Multitasking
if (!(Test-Path -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\System")) {
    New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\System" -Force
}
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\System" -Name "EnableActivityFeed" -Type DWord -Value 0
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\System" -Name "PublishUserActivities" -Type DWord -Value 0
Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\System" -Name "UploadUserActivities" -Type DWord -Value 0

Write-Host "Disabled  : Timeline in Windows Multitasking"

#---------------------------------------------------------------------------------------
# Don't Update Maps
if (!(Test-Path -Path "HKLM:\SYSTEM\Maps")) {
    New-Item -Path "HKLM:\SYSTEM\Maps" -Force
}
Set-ItemProperty -Path "HKLM:\SYSTEM\Maps" -Name "AutoUpdateEnabled" -Type DWord -Value 0

Write-Host "Disabled  : Automatic Maps Updates"

#---------------------------------------------------------------------------------------
# Denying Sensor Permissions
if (!(Test-Path -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Sensor\Overrides\{BFA794E4-F964-4FDB-90F6-51056BFE4B44}")) {
    New-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Sensor\Overrides\{BFA794E4-F964-4FDB-90F6-51056BFE4B44}" -Force
}
Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Sensor\Overrides\{BFA794E4-F964-4FDB-90F6-51056BFE4B44}" -Name "SensorPermissionState" -Type DWord -Value 0

Write-Host "Disabled  : Sensor Permissions"

#---------------------------------------------------------------------------------------
# Show File Extensions
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "HideFileExt" -Value 0
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name "Hidden" -Value 1

Write-Host "Enabled   : Show Hidden Files"
Write-Host "Enabled   : Show File Extenstions"
