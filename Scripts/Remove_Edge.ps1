$path = "C:\fastwindows"
$batfilepath = "$path/edgeremoval.bat"
$url = "https://raw.githubusercontent.com/thekarananand/FastWindows/main/ExternalScripts/edgeremoval.bat"

try {
    if (-Not (Test-Path -Path $path)) {
        New-Item -Path $path -ItemType Directory
    }

    Set-Location $path
    Invoke-WebRequest -Uri $url -UseBasicParsing | ForEach-Object { $_.Content } | Out-File -FilePath $batfilepath -Encoding ASCII
    Start-Process -FilePath $batfilepath -NoNewWindow -Wait

    Write-Output "Removed   : Microsoft Edge"
} catch {
    Write-Output "Error     : Microsoft Edge"
}

Set-Location "C:\Windows\system32"
Remove-Item -Path $path -Recurse -Force