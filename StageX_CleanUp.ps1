Remove-Item -Path "C:\Program Files (x86)\Microsoft\Edge" -Recurse -Force
Remove-Item -Path "C:\Program Files (x86)\Microsoft\EdgeUpdate" -Recurse -Force

Remove-Item -Recurse -Force -ErrorAction SilentlyContinue "$env:localappdata\Microsoft\OneDrive"
Remove-Item -Recurse -Force -ErrorAction SilentlyContinue "$env:programdata\Microsoft OneDrive"
Remove-Item -Recurse -Force -ErrorAction SilentlyContinue "C:\OneDriveTemp"


takeown /f C:Windows\System32\OneDriveSetup.exe
del /f /q /s "C:\Windows\System32\OneDriveSetup.exe"