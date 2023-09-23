Write-Host "`nStage 3 : INSTALLING NEW APPS"
Write-Host "========================================================="

try {
    winget install Mozilla.Firefox --accept-source-agreements --accept-package-agreements
    Write-Host "Installed : Mozilla.Firefox"
} catch {
    Write-Host "Error     : Mozilla.Firefox"
}

try {
    winget install Microsoft.WindowsTerminal --accept-source-agreements --accept-package-agreements
    Write-Host "Installed : Microsoft.WindowsTerminal"
} catch {
    Write-Host "Error     : Microsoft.WindowsTerminal"
}

try {
    winget install VideoLAN.VLC --accept-source-agreements --accept-package-agreements
    Write-Host "Installed : VideoLAN.VLC"
} catch {
    Write-Host "Error     : VideoLAN.VLC"
}