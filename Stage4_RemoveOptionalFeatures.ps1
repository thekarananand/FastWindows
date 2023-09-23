Write-Host "`nStage 4 : REMOVED OPTIONAL FEATURES"
Write-Host "========================================================="


dism /Online /Get-Packages | Select-String "Package Identity" | Select-String "InternetExplorer" | ForEach-Object {
    $packageName = $_.Line.Split(':')[1].Trim()
    dism /Online /Remove-Package /NoRestart /PackageName:$packageName
}

dism /Online /Remove-Capability /NoRestart /CapabilityName:Browser.InternetExplorer~~~~0.0.11.0

Write-Host "Removed   : Internet Explorer"

dism /Online /Remove-Capability /NoRestart /CapabilityName:Microsoft.Windows.WordPad~~~~0.0.1.0
Write-Host "Removed   : WordPad"

dism /Online /Remove-Capability /NoRestart /CapabilityName:Microsoft.Windows.PowerShell.ISE~~~~0.0.1.0
Write-Host "Removed   : PowerShell ISE"

dism /Online /Remove-Capability /NoRestart /CapabilityName:Microsoft.Windows.Notepad.System~~~~0.0.1.0
Write-Host "Removed   : NotePad (System)"

dism /Online /Get-Packages | Select-String "Package Identity" | Select-String "MediaPlayer" | ForEach-Object {
    $packageName = $_.Line.Split(':')[1].Trim()
    dism /Online /Remove-Package /NoRestart /PackageName:$packageName
}

dism /Online /Remove-Capability /NoRestart /CapabilityName:Media.WindowsMediaPlayer~~~~0.0.12.0
Write-Host "Removed   : Windows Media Player"

dism /Online /Remove-Capability /NoRestart /CapabilityName:App.StepsRecorder~~~~0.0.1.0
Write-Host "Removed   : StepsRecorder"

dism /Online /Get-Packages | Select-String "Package Identity" | Select-String "Windows-Kernel-LA57" | ForEach-Object {
    $packageName = $_.Line.Split(':')[1].Trim()
    dism /Online /Remove-Package /NoRestart /PackageName:$packageName
}
Write-Host "Removed   : Windows Kernel LA57"

dism /Online /Get-Packages | Select-String "Package Identity" | Select-String "Wallpaper-Content-Extended" | ForEach-Object {
    $packageName = $_.Line.Split(':')[1].Trim()
    dism /Online /Remove-Package /NoRestart /PackageName:$packageName
}
Write-Host "Removed   : Extended Wallpaper Content"

dism /Online /Get-Packages | Select-String "Package Identity" | Select-String "TabletPCMath" | ForEach-Object {
    $packageName = $_.Line.Split(':')[1].Trim()
    dism /Online /Remove-Package /NoRestart /PackageName:$packageName
}
Write-Host "Removed   : Tablet PC Math"

dism /Online /Get-Packages | Select-String "Package Identity" | Select-String "LanguageFeatures-Handwriting" | ForEach-Object {
    $packageName = $_.Line.Split(':')[1].Trim()
    dism /Online /Remove-Package /NoRestart /PackageName:$packageName
}
Write-Host "Removed   : Language Features - Handwriting"

dism /Online /Get-Packages | Select-String "Package Identity" | Select-String "LanguageFeatures-OCR" | ForEach-Object {
    $packageName = $_.Line.Split(':')[1].Trim()
    dism /Online /Remove-Package /NoRestart /PackageName:$packageName
}
Write-Host "Removed   : Language Features - OCR"

dism /Online /Get-Packages | Select-String "Package Identity" | Select-String "LanguageFeatures-Speech" | ForEach-Object {
    $packageName = $_.Line.Split(':')[1].Trim()
    dism /Online /Remove-Package /NoRestart /PackageName:$packageName
}
Write-Host "Removed   : Language Features - Speech"

dism /Online /Get-Packages | Select-String "Package Identity" | Select-String "LanguageFeatures-TextToSpeech" | ForEach-Object {
    $packageName = $_.Line.Split(':')[1].Trim()
    dism /Online /Remove-Package /NoRestart /PackageName:$packageName
}
Write-Host "Removed   : Language Features - TextToSpeech"


######################################################################################################################################################

# try {
#     dism /Online /Remove-Package /NoRestart /PackageName:Microsoft-Windows-InternetExplorer-Optional-Package~31bf3856ad364e35~amd64~en-US~11.0.22621.1  | Out-Null
#     dism /Online /Remove-Package /NoRestart /PackageName:Microsoft-Windows-InternetExplorer-Optional-Package~31bf3856ad364e35~amd64~~11.0.22621.1265  | Out-Null
    
#     dism /Online /Remove-Capability /NoRestart /CapabilityName:Browser.InternetExplorer~~~~0.0.11.0 | Out-Null

#     Write-Host "Removed   : Internet Explorer"
# } catch {
#     Write-Host "Error     : Internet Explorer"
# }

# try {
#     dism /Online /Remove-Capability /NoRestart /CapabilityName:Microsoft.Windows.WordPad~~~~0.0.1.0 | Out-Null
#     Write-Host "Removed   : WordPad"
# } catch {
#     Write-Host "Error     : WordPad"
# }

# try {
#     dism /Online /Remove-Capability /NoRestart /CapabilityName:Microsoft.Windows.PowerShell.ISE~~~~0.0.1.0 | Out-Null
#     Write-Host "Removed   : PowerShell ISE"
# } catch {
#     Write-Host "Error     : PowerShell ISE"
# }

# try {
#     dism /Online /Remove-Capability /NoRestart /CapabilityName:Microsoft.Windows.Notepad.System~~~~0.0.1.0 | Out-Null
#     Write-Host "Removed   : NotePad (System)"
# } catch {
#     Write-Host "Error     : NotePad (System)"
# }

# try {
#     dism /Online /Remove-Package /NoRestart /PackageName:Microsoft-Windows-MediaPlayer-Package~31bf3856ad364e35~amd64~~10.0.22621.1265 | Out-Null
#     dism /Online /Remove-Package /NoRestart /PackageName:Microsoft-Windows-MediaPlayer-Package~31bf3856ad364e35~wow64~en-US~10.0.22621.1 | Out-Null
#     dism /Online /Remove-Package /NoRestart /PackageName:Microsoft-Windows-MediaPlayer-Package~31bf3856ad364e35~amd64~~10.0.22621.1265 | Out-Null
#     dism /Online /Remove-Package /NoRestart /PackageName:Microsoft-Windows-MediaPlayer-Package~31bf3856ad364e35~wow64~~10.0.22621.1 | Out-Null

#     dism /Online /Remove-Capability /NoRestart /CapabilityName:Media.WindowsMediaPlayer~~~~0.0.12.0 | Out-Null

#     Write-Host "Removed   : Windows Media Player"
# } catch {
#     Write-Host "Error     : Windows Media Player"
# }

# try {
#     dism /Online /Remove-Capability /NoRestart /CapabilityName:App.StepsRecorder~~~~0.0.1.0 | Out-Null
#     Write-Host "Removed   : StepsRecorder"
# } catch {
#     Write-Host "Error     : StepsRecorder"
# }

# try {
#     dism /Online /Remove-Package /NoRestart /PackageName:Microsoft-Windows-Kernel-LA57-FoD-Package~31bf3856ad364e35~amd64~~10.0.22621.1265 | Out-Null
#     Write-Host "Removed   : Windows Kernel LA57"
# } catch {
#     Write-Host "Error     : Windows Kernel LA57"
# }

# try {
#     dism /Online /Remove-Package /NoRestart /PackageName:Microsoft-Windows-Wallpaper-Content-Extended-FoD-Package~31bf3856ad364e35~amd64~~10.0.22621.1265 | Out-Null
#     Write-Host "Removed   : Extended Wallpaper Content"
# } catch {
#     Write-Host "Error     : Extended Wallpaper Content"
# }

# try {
#     dism /Online /Remove-Package /NoRestart /PackageName:Microsoft-Windows-TabletPCMath-Package~31bf3856ad364e35~amd64~~10.0.22621.1265 | Out-Null
#     Write-Host "Removed   : Tablet PC Math"
# } catch {
#     Write-Host "Error     : Tablet PC Math"
# }

# try {
#     dism /Online /Remove-Package /NoRestart /PackageName:Microsoft-Windows-LanguageFeatures-Handwriting-en-us-Package~31bf3856ad364e35~amd64~~10.0.22621.1265 | Out-Null
#     dism /Online /Remove-Package /NoRestart /PackageName:Microsoft-Windows-LanguageFeatures-OCR-en-us-Package~31bf3856ad364e35~amd64~~10.0.22621.1265 | Out-Null
#     dism /Online /Remove-Package /NoRestart /PackageName:Microsoft-Windows-LanguageFeatures-Speech-en-us-Package~31bf3856ad364e35~amd64~~10.0.22621.1265 | Out-Null
#     dism /Online /Remove-Package /NoRestart /PackageName:Microsoft-Windows-LanguageFeatures-TextToSpeech-en-us-Package~31bf3856ad364e35~amd64~~10.0.22621.1265 | Out-Null

#     Write-Host "Removed   : Language Features"
# } catch {
#     Write-Host "Error     : Language Features"
# }