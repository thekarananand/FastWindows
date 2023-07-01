$URL = "https://sourceforge.net/projects/mingw/files/Installer/mingw-get-setup.exe/download"
$Output = "mingw-get-setup.exe"
Invoke-WebRequest -Uri $URL -OutFile $Output
Start-Process -FilePath $Output -ArgumentList "/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-"
$Path = "C:\MinGW\bin"
$Env:Path += ";$Path"
