Get-AppxPackage Microsoft.WidgetsPlatformRuntime | Remove-AppxPackage
Get-AppxPackage *WebExperience* | Remove-AppxPackage
winget uninstall --id 9MSSGKG348SP