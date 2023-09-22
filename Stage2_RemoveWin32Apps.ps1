Write-Host "Stage 2 : REMOVING EDGE, ONEDRIVE, AND OTHER WIN32 APPS"
Write-Host "=========================================================`n"

# Edge 

irm https://raw.githubusercontent.com/thekarananand/FastWindows/main/Scripts/edgeremoval.bat | iex
cd "C:\Program Files (x86)\Microsoft\EdgeWebView\Application\1*\Installer"
.\setup.exe --uninstall --msedgewebview --system-level --verbose-logging --force-uninstall

# Teams
winget uninstall Microsoft.Teams --accept-source-agreements --accept-package-agreements

# OneDrive
winget uninstall Microsoft.OneDriveSync_8wekyb3d8bbwe --accept-source-agreements --accept-package-agreements
winget uninstall Microsoft.OneDrive --accept-source-agreements --accept-package-agreements

takeown /f C:Windows\System32\OneDriveSetup.exe
del /f /q /s "C:\Windows\System32\OneDriveSetup.exe"

taskkill /f /im OneDrive.exe
cd "C:\Windows\System32"
OneDriveSetup.exe /uninstall
cd "C:\Windows\SysWOW64"
OneDriveSetup.exe /uninstall

cd "C:\Windows\system32"