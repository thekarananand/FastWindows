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
    "AllowSearchToUseLocation"
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
    New-Item -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\SearchSettings" -Force
}
Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\SearchSettings" -Name "IsDynamicSearchBoxEnabled" -Value 0 | Out-Null

Write-Host "Disabled  : Windows Search History"
Write-Host "Disabled  : Bing/Web Search in Windows Search"
Write-Host "Disabled  : Dynamic Search Highlights"