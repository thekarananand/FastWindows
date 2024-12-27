$registrySettings = @(
    [PSCustomObject]@{
        Purpose = "Disable    : Windows Spotlight"
        Path    = "HKCU:\Software\Policies\Microsoft\Windows\CloudContent"
        Name    = "DisableSpotlightCollectionOnDesktop"
        Value   = 1
        Type    = "DWord"
    },
    [PSCustomObject]@{
        Purpose = "Enable     : Dark Mode for Apps"
        Path    = "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize"
        Name    = "AppsUseLightTheme"
        Value   = 0
        Type    = "DWord"
    },
    [PSCustomObject]@{
        Purpose = "Enable     : Dark Mode for System"
        Path    = "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize"
        Name    = "SystemUsesLightTheme"
        Value   = 0
        Type    = "DWord"
    },
    [PSCustomObject]@{
        Purpose = "Enable     : This PC as Default Path in Explorer"
        Path    = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced"
        Name    = "LaunchTo"
        Value   = 1
        Type    = "DWord"
    },
    [PSCustomObject]@{
        Purpose = "Disable    : Hidden Files"
        Path    = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced"
        Name    = "HideFileExt"
        Value   = 0
        Type    = "DWord"
    },
    [PSCustomObject]@{
        Purpose = "Disable    : Hidden File Ext."
        Path    = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced"
        Name    = "Hidden"
        Value   = 1
        Type    = "DWord"
    },
    [PSCustomObject]@{
        Purpose = "Disable    : Search Icon/Bar in Taskbar"
        Path    = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Search"
        Name    = "SearchboxTaskbarMode"
        Value   = 0
        Type    = "DWord"
    },
    [PSCustomObject]@{
        Purpose = "Disable    : Dynamic Search Box"
        Path    = "HKCU:\Software\Microsoft\Windows\CurrentVersion\SearchSettings"
        Name    = "IsDynamicSearchBoxEnabled"
        Value   = 0
        Type    = "DWord"
    },
    [PSCustomObject]@{
        Purpose = "Disable    : Web Search in Windows Search"
        Path    = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Search"
        Name    = "DisableWebSearch"
        Value   = 1
        Type    = "DWord"
    },
    [PSCustomObject]@{
        Purpose = "Disable    : Bing Search in Windows Search"
        Path    = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Search"
        Name    = "BingSearchEnabled"
        Value   = 0
        Type    = "DWord"
    },
    [PSCustomObject]@{
        Purpose = "Disable    : More Tiles in Start"
        Path    = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced"
        Name    = "Start_Layout"
        Value   = 1
        Type    = "DWord"
    },
    [PSCustomObject]@{
        Purpose = "Disable    : Lock Screen Overlay"
        Path    = "HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager"
        Name    = "RotatingLockScreenOverlayEnabled"
        Value   = 0
        Type    = "DWord"
    },
    [PSCustomObject]@{
        Purpose = "Disable    : Lock Screen Subscribed Content 338387"
        Path    = "HKCU:\Software\Microsoft\Windows\CurrentVersion\ContentDeliveryManager"
        Name    = "SubscribedContent-338387Enabled"
        Value   = 0
        Type    = "DWord"
    }
)

foreach ($setting in $registrySettings) {


    # Check if the registry path exists, create it if it doesn't
    if (-not (Test-Path $setting.Path)) {
        New-Item -Path $setting.Path -Force
        New-ItemProperty -Path $setting.Path -Name $setting.Name -Value $setting.Value -Type $setting.Type
    }
    # Set the registry value
    Set-ItemProperty -Path $setting.Path -Name $setting.Name -Value $setting.Value -Type $setting.Type
    Write-Output "$($setting.Purpose)"
}


Write-Output " "
Write-Output "Restarting : Windows Explorer"

taskkill /f /im explorer.exe | Out-Null 
Start-Process explorer.exe