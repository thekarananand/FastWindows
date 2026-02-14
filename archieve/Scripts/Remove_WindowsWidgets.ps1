$registrySettings = @(
    [PSCustomObject]@{
        Purpose = "Disable    : EnableFeeds"
        Path    = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Windows Feeds"
        Name    = "EnableFeeds"
        Value   = 0
        Type    = "DWord"
    },
    [PSCustomObject]@{
        Purpose = "Disable    : AllowNewsAndInterests"
        Path    = "HKLM:\SOFTWARE\Microsoft\PolicyManager\default\NewsAndInterests\AllowNewsAndInterests"
        Name    = "value"
        Value   = 0
        Type    = "DWord"
    }
)
    
foreach ($setting in $registrySettings) {
    if (-not (Test-Path $setting.Path)) {
        New-Item -Path $setting.Path -Force
        New-ItemProperty -Path $setting.Path -Name $setting.Name -Value $setting.Value -Type $setting.Type
    }
    Set-ItemProperty -Path $setting.Path -Name $setting.Name -Value $setting.Value -Type $setting.Type
    Write-Output "$($setting.Purpose)"
}

Get-AppxPackage Microsoft.WidgetsPlatformRuntime | Remove-AppxPackage 
Write-Output "Removed    : Microsoft.WidgetsPlatformRuntime"

Get-AppxPackage *WebExperience* | Remove-AppxPackage
Write-Output "Removed    : WebExperience Packages"

winget uninstall --id 9MSSGKG348SP
Write-Output "Removed    : 9MSSGKG348SP"

Write-Output " "
Write-Output "Removed    : Windows Widgets"