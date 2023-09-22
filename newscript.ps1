# Disable the Bing search (AI chat) button
try {
    if (!(Test-Path -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge')) {
        New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge' -Force
    }
    Set-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Edge' -Name 'HubsSidebarEnabled' -Value 0 -Type DWord
    Write-Host "- Bing search (AI chat) button has been disabled."
} catch {
    Write-Host "Failed to disable the Bing search (AI chat) button."
}


# Disable Mozilla Firefox Telemetry
try {
    New-Item -Path 'HKLM:\SOFTWARE\Policies\Mozilla\Firefox' -Force
    Set-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Mozilla\Firefox' -Name 'DisableTelemetry' -Value 1 -Type DWord
    Set-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Mozilla\Firefox' -Name 'DisableDefaultBrowserAgent' -Value 1 -Type DWord
    Write-Host "- Mozilla Firefox Telemetry has been disabled."
} catch {
    Write-Host "Failed to disable Mozilla Firefox Telemetry."
}



# Disable Google Chrome Telemetry
try {
    New-Item -Path 'HKLM:\SOFTWARE\Policies\Google\Chrome' -Force
    Set-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Google\Chrome' -Name 'MetricsReportingEnabled' -Value 0 -Type DWord
    Set-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Google\Chrome' -Name 'ChromeCleanupReportingEnabled' -Value 0 -Type DWord
    Set-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Google\Chrome' -Name 'SubscribedContent-353696Enabled' -Value 0 -Type DWord
    Write-Host "- Google Chrome Telemetry has been disabled."
} catch {
    Write-Host "Failed to disable Google Chrome Telemetry."
}


# Disable Snap Assist Layout
try {
    Set-ItemProperty -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced' -Name 'EnableSnapAssistFlyout' -Value 0 -Type DWord
    Write-Host "- Snap Assist Layout has been disabled."
    Write-Host "Please restart your PC for the changes to take effect."
} catch {
    Write-Host "Failed to disable Snap Assist Layout."
}

# Disable Widgets
try {
    Set-ItemProperty -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced' -Name 'TaskbarDa' -Value 0 -Type DWord
    Write-Host "- Widgets have been disabled."
} catch {
    Write-Host "Failed to disable Widgets."
}

# Uninstall the Widgets app
try {
    Write-Host "- Uninstalling Widgets app..."
    Start-Process "winget" -ArgumentList "uninstall 'windows web experience pack' --silent" -NoNewWindow -Wait
    Write-Host "Done."
} catch {
    Write-Host "Failed to uninstall the Widgets app."
}

# Remove Desktop Stickers
try {
    if (!(Test-Path -Path 'HKLM:\SOFTWARE\Microsoft\PolicyManager\current\device\Stickers')) {
        New-Item -Path 'HKLM:\SOFTWARE\Microsoft\PolicyManager\current\device\Stickers' -Force
    }
    Set-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\PolicyManager\current\device\Stickers' -Name 'EnableStickers' -Value 0 -Type DWord
    Write-Host "- Desktop Stickers have been removed."
} catch {
    Write-Host "Failed to remove Desktop Stickers."
}

# Enable more Pins on Start menu
try {
    Set-ItemProperty -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced' -Name 'Start_Layout' -Value 1 -Type DWord
    Write-Host "- Start menu layout is now showing more Pins."
} catch {
    Write-Host "Failed to enable more Pins on Start menu."
}

# Disable Most Used Apps
try {
    if (!(Test-Path -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Explorer')) {
        New-Item -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Explorer' -Force
    }    
    Set-ItemProperty -Path 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Explorer' -Name 'ShowOrHideMostUsedApps' -Value 2 -Type DWord
    Write-Host "- Most Used Apps have been disabled."
} catch {
    Write-Host "Failed to disable Most Used Apps."
}

# Disable Advertising ID for Relevant Ads
try {
    Set-ItemProperty -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\AdvertisingInfo' -Name 'Enabled' -Value 0 -Type DWord
    Write-Host "- Advertising ID for Relevant Ads has been successfully disabled."
} catch {
    Write-Host "Failed to disable Advertising ID for Relevant Ads."
}


# Disable Automatic Installation of apps
try {
    Set-ItemProperty -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager' -Name 'SilentInstalledAppsEnabled' -Value 0 -Type DWord
    Write-Host "- Automatic Installation of apps has been successfully disabled."
} catch {
    Write-Host "Failed to disable Automatic Installation of apps."
}

# Disable App access to running in background
try {
    Set-ItemProperty -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications' -Name 'GlobalUserDisabled' -Value 1 -Type DWord
    Write-Host "- App access to running in background has been successfully disabled."
} catch {
    Write-Host "Failed to disable App access to running in the background."
}

# Disable Feedback notifications
try {
    if (!(Test-Path -Path 'HKCU:\Software\Microsoft\Siuf\Rules')) {
        New-Item -Path 'HKCU:\Software\Microsoft\Siuf\Rules' -Force
    }
    Set-ItemProperty -Path 'HKCU:\Software\Microsoft\Siuf\Rules' -Name 'PeriodInNanoSeconds' -Value 0 -Type DWord
    Set-ItemProperty -Path 'HKCU:\Software\Microsoft\Siuf\Rules' -Name 'NumberOfSIUFInPeriod' -Value 0 -Type DWord
    Write-Host "- Feedback notifications have been successfully disabled."
} catch {
    Write-Host "Failed to disable Feedback notifications."
}



# Disable Suggested content in Settings app
try {
        Set-ItemProperty -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager' -Name 'SubscribedContent-338393Enabled' -Value 0 -Type DWord
        Set-ItemProperty -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager' -Name 'SubscribedContent-353694Enabled' -Value 0 -Type DWord
        Set-ItemProperty -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager' -Name 'SubscribedContent-353696Enabled' -Value 0 -Type DWord

        Write-Host "- Suggested content in Settings app has been successfully disabled."
} catch {
        Write-Host "Failed to disable Suggested content in Settings app."
}


# Disable Connected User Experiences and Telemetry
try {
        Set-ItemProperty -Path 'HKLM:\Software\Policies\Microsoft\Windows\DataCollection' -Name 'AllowTelemetry' -Value 0 -Type DWord
        Set-ItemProperty -Path 'HKLM:\SYSTEM\ControlSet001\Services\DiagTrack' -Name 'Start' -Value 4 -Type DWord
        Set-ItemProperty -Path 'HKLM:\SYSTEM\ControlSet001\Services\dmwappushservice' -Name 'Start' -Value 4 -Type DWord

        Stop-Service -Name 'DiagTrack' -Force
        Stop-Service -Name 'dmwappushservice' -Force

        Write-Host "- Connected User Experiences and Telemetry has been successfully disabled."
} catch {
        Write-Host "Failed to disable Connected User Experiences and Telemetry."
}

# Disable Windows Tips

try {
        Set-ItemProperty -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager' -Name 'SubscribedContent-338393Enabled' -Value 0 -Type DWord
        Write-Host "- Windows 11 tips have been successfully disabled."
} catch {
        Write-Host "Failed to disable Windows 11 tips."
}

# Disable Windows Hello Biometrics
try {
    if (!(Test-Path -Path 'HKLM:\Software\Policies\Microsoft\Biometrics')) {
        New-Item -Path 'HKLM:\Software\Policies\Microsoft\Biometrics' -Force
    }
    Set-ItemProperty -Path 'HKLM:\Software\Policies\Microsoft\Biometrics' -Name 'Enabled' -Value 0 -Type DWord
    Write-Host "- Windows Hello Biometrics has been successfully disabled."
} catch {
    Write-Host "Failed to disable Windows Hello Biometrics."
}

# Disable Compatibility Telemetry
try {
    if (!(Test-Path -Path 'HKLM:\Software\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\CompatTelRunner.exe')) {
        New-Item -Path 'HKLM:\Software\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\CompatTelRunner.exe' -Force
    }
    Set-ItemProperty -Path 'HKLM:\Software\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\CompatTelRunner.exe' -Name 'Debugger' -Value '%windir%\System32\taskkill.exe' -Type String
    Write-Host "- Compatibility Telemetry has been successfully disabled."
} catch {
    Write-Host "Failed to disable Compatibility Telemetry."
}

# Hide Search icon on the taskbar
try {
    Set-ItemProperty -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Search' -Name 'SearchboxTaskbarMode' -Value 0 -Type DWord

    Write-Host "- Search icon on the taskbar has been disabled."
} catch {
    Write-Host "Failed to disable search icon on the taskbar."
}

# Disable Game DVR feature
try {
    Set-ItemProperty -Path 'HKCU:\System\GameConfigStore' -Name 'GameDVR_Enabled' -Value 0 -Type DWord
    Set-ItemProperty -Path 'HKCU:\System\GameConfigStore' -Name 'GameDVR_FSEBehaviorMode' -Value 2 -Type DWord
    Set-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\PolicyManager\default\ApplicationManagement\AllowGameDVR' -Name 'value' -Value 0 -Type DWord

    Write-Host "- Game DVR feature has been successfully disabled."
} catch {
    Write-Host "Failed to disable Game DVR feature."
}

# Remove Windows 11 System requirements watermark
try {
    Set-ItemProperty -Path 'HKCU:\Control Panel\UnsupportedHardwareNotificationCache' -Name 'SV2' -Value 0 -Type DWord

    Write-Host "- Watermark and the settings notification should be gone."
} catch {
    Write-Host "Failed to remove the Windows 11 System requirements watermark."
}