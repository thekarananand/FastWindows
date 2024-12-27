try {
    taskkill /f /im OneDrive.exe | Out-Null

    winget uninstall Microsoft.OneDriveSync_8wekyb3d8bbwe --accept-source-agreements --silent | Out-Null
    winget uninstall Microsoft.OneDrive --accept-source-agreements --silent | Out-Null

    Set-Location "C:\Windows\System32"
    OneDriveSetup.exe /uninstall

    Set-Location "C:\Windows\SysWOW64"
    OneDriveSetup.exe /uninstall
    
    Write-Output "Removed   : Microsoft OneDrive"
} catch {
    Write-Output "Error     : Microsoft OneDrive"
}

Set-Location "C:\Windows\system32"