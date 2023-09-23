Remove-Item -Path "C:\Program Files (x86)\Microsoft\Edge" -Recurse -Force
Remove-Item -Path "C:\Program Files (x86)\Microsoft\EdgeUpdate" -Recurse -Force

Remove-Item -Recurse -Force -ErrorAction SilentlyContinue "$env:localappdata\Microsoft\OneDrive"
Remove-Item -Recurse -Force -ErrorAction SilentlyContinue "$env:programdata\Microsoft OneDrive"
Remove-Item -Recurse -Force -ErrorAction SilentlyContinue "C:\OneDriveTemp"


takeown /f C:Windows\System32\OneDriveSetup.exe
del /f /q /s "C:\Windows\System32\OneDriveSetup.exe"

# Clear Internet Explorer cache
Clear-IECache -Confirm:$false

# Clear temporary files
Remove-Item -Path "$env:TEMP\*" -Force -Recurse
Remove-Item -Path "$env:LOCALAPPDATA\Temp\*" -Force -Recurse

# Clear user profile temporary files
Remove-Item -Path "$env:USERPROFILE\AppData\Local\Temp\*" -Force -Recurse
Remove-Item -Path "$env:USERPROFILE\AppData\Local\Microsoft\Windows\Temporary Internet Files\*" -Force -Recurse

# Clear Windows thumbnail cache
Stop-Process -Name explorer -Force
$thumbnailCachePath = "$env:LOCALAPPDATA\Microsoft\Windows\Explorer"
Remove-Item -Path "$thumbnailCachePath\thumbcache_*.db" -Force
Remove-Item -Path "$thumbnailCachePath\iconcache_*.db" -Force
Start-Process explorer

# Clear Recycle Bin
Clear-RecycleBin -Confirm:$false

# Removing Unnecessary Shortcuts
Remove-Item $env:HOMEPATH\AppData\Roaming\Microsoft\Windows\Start` Menu\Programs\OneDrive.lnk
Remove-Item $env:HOMEPATH\AppData\Roaming\Microsoft\Windows\Start` Menu\Programs\Firefox` Private` Browsing.lnk
Remove-Item C:\ProgramData\Microsoft\Windows\Start` Menu\Programs\Firefox` Private` Browsing.lnk

# Restart Windows Explorer to apply the changes
Stop-Process -Name "explorer" -Force
Start-Process "explorer"