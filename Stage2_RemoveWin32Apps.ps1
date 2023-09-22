Write-Host "Stage 2 : REMOVING EDGE, ONEDRIVE, AND OTHER WIN32 APPS"
Write-Host "=========================================================`n"

# Edge 
irm https://raw.githubusercontent.com/thekarananand/FastWindows/main/Scripts/edgeremoval.bat | iex
cd "C:\Program Files (x86)\Microsoft\EdgeWebView\Application\1*\Installer"
.\setup.exe --uninstall --msedgewebview --system-level --verbose-logging --force-uninstall
rd "C:\scratchdir\Program Files (x86)\Microsoft\Edge" /s /q
rd "C:\scratchdir\Program Files (x86)\Microsoft\EdgeUpdate" /s /q
cd "C:\Windows\system32"

# Teams
winget uninstall Microsoft.Teams

# OneDrive
winget uninstall Microsoft.OneDriveSync_8wekyb3d8bbwe
winget uninstall Microsoft.OneDrive

takeown /f C:\scratchdir\Windows\System32\OneDriveSetup.exe
icacls C:\scratchdir\Windows\System32\OneDriveSetup.exe /grant Administrators:F /T /C
del /f /q /s "C:\scratchdir\Windows\System32\OneDriveSetup.exe"

taskkill /f /im OneDrive.exe
%SystemRoot%\System32\OneDriveSetup.exe /uninstall
%SystemRoot%\SysWOW64\OneDriveSetup.exe /uninstall
Remove-Item -Recurse -Force -ErrorAction SilentlyContinue "$env:localappdata\Microsoft\OneDrive"
Remove-Item -Recurse -Force -ErrorAction SilentlyContinue "$env:programdata\Microsoft OneDrive"
Remove-Item -Recurse -Force -ErrorAction SilentlyContinue "C:\OneDriveTemp"

# Health App
winget uninstall --name "Microsoft Update Health Tools"