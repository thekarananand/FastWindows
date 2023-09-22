Write-Host "`nStage 2 : REMOVING EDGE, ONEDRIVE, AND OTHER WIN32 APPS"
Write-Host "========================================================="

# Edge 
try {
    irm https://raw.githubusercontent.com/thekarananand/FastWindows/main/Scripts/edgeremoval.bat | iex
    cd "C:\Program Files (x86)\Microsoft\EdgeWebView\Application\1*\Installer"
    .\setup.exe --uninstall --msedgewebview --system-level --verbose-logging --force-uninstall 
    cd "C:\Windows\system32"
    Write-Host "Removed   : Microsoft Edge"
    Write-Host "Caution   : Edge Remover might be running... Let it do it's Job"
} catch {
    Write-Host "Error     : Microsoft Edge"
}

# Teams
try {
    winget uninstall Microsoft.Teams --accept-source-agreements --silent | Out-Null
    Write-Host "Removed   : Microsoft Teams"
} catch {
    Write-Host "Error     : Microsoft Teams"
}

# OneDrive
try {
    taskkill /f /im OneDrive.exe | Out-Null

    winget uninstall Microsoft.OneDriveSync_8wekyb3d8bbwe --accept-source-agreements --silent | Out-Null
    winget uninstall Microsoft.OneDrive --accept-source-agreements --silent | Out-Null

    cd "C:\Windows\System32"
    OneDriveSetup.exe /uninstall
    cd "C:\Windows\SysWOW64"
    OneDriveSetup.exe /uninstall
    cd "C:\Windows\system32"
    Write-Host "Removed   : Microsoft OneDrive"
} catch {
    Write-Host "Error     : Microsoft OneDrive"
}
