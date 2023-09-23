Write-Host "`nStage 5 : REGEDIT TWEAKS"
Write-Host "========================================================="

#----------------------------------------------------------------------------------------------------

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

foreach ($Tweak in $ContentDeliveryManagerTweaks_SetZero) {
    New-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" -Name $Tweak -Value 0 -Type DWord -Force
}

if (!(Test-Path -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\CloudContent")) {
    New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\CloudContent" -Force
}
New-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\CloudContent" -Name 'DisableWindowsConsumerFeatures' -Value 1 -Type DWord -Force

if (!(Test-Path -Path "HKLM:\SOFTWARE\Microsoft\PolicyManager\current\device\Start")) {
    New-Item -Path "HKLM:\SOFTWARE\Microsoft\PolicyManager\current\device\Start" -Force
}
New-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\PolicyManager\current\device\Start" -Name 'ConfigureStartPins' -Value '{"pinnedList": [{}]}' -Type String -Force

Write-Host "Disabled  : Sponsored Apps in Start"

#----------------------------------------------------------------------------------------------------