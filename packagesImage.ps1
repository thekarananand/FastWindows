
dism /Online /Get-ProvisionedAppxPackages | Select-String PackageName | Select-String Clipchamp.Clipchamp | ForEach-Object {$_.Line.Split(':')[1].Trim()} | ForEach-Object { dism /Online /Remove-ProvisionedAppxPackage /PackageName:$_}
dism /Online /Get-ProvisionedAppxPackages | Select-String PackageName | Select-String Microsoft.549981C3F5F10 | ForEach-Object {$_.Line.Split(':')[1].Trim()} | ForEach-Object { dism /Online /Remove-ProvisionedAppxPackage /PackageName:$_}
dism /Online /Get-ProvisionedAppxPackages | Select-String PackageName | Select-String Microsoft.BingNews | ForEach-Object {$_.Line.Split(':')[1].Trim()} | ForEach-Object { dism /Online /Remove-ProvisionedAppxPackage /PackageName:$_}
dism /Online /Get-ProvisionedAppxPackages | Select-String PackageName | Select-String Microsoft.BingWeather | ForEach-Object {$_.Line.Split(':')[1].Trim()} | ForEach-Object { dism /Online /Remove-ProvisionedAppxPackage /PackageName:$_}
dism /Online /Get-ProvisionedAppxPackages | Select-String PackageName | Select-String Microsoft.GamingApp | ForEach-Object {$_.Line.Split(':')[1].Trim()} | ForEach-Object { dism /Online /Remove-ProvisionedAppxPackage /PackageName:$_}
dism /Online /Get-ProvisionedAppxPackages | Select-String PackageName | Select-String Microsoft.GetHelp | ForEach-Object {$_.Line.Split(':')[1].Trim()} | ForEach-Object { dism /Online /Remove-ProvisionedAppxPackage /PackageName:$_}
dism /Online /Get-ProvisionedAppxPackages | Select-String PackageName | Select-String Microsoft.Getstarted | ForEach-Object {$_.Line.Split(':')[1].Trim()} | ForEach-Object { dism /Online /Remove-ProvisionedAppxPackage /PackageName:$_}
dism /Online /Get-ProvisionedAppxPackages | Select-String PackageName | Select-String Microsoft.MicrosoftOfficeHub | ForEach-Object {$_.Line.Split(':')[1].Trim()} | ForEach-Object { dism /Online /Remove-ProvisionedAppxPackage /PackageName:$_}
dism /Online /Get-ProvisionedAppxPackages | Select-String PackageName | Select-String Microsoft.MicrosoftSolitaireCollection | ForEach-Object {$_.Line.Split(':')[1].Trim()} | ForEach-Object { dism /Online /Remove-ProvisionedAppxPackage /PackageName:$_}
dism /Online /Get-ProvisionedAppxPackages | Select-String PackageName | Select-String Microsoft.MicrosoftStickyNotes | ForEach-Object {$_.Line.Split(':')[1].Trim()} | ForEach-Object { dism /Online /Remove-ProvisionedAppxPackage /PackageName:$_}
dism /Online /Get-ProvisionedAppxPackages | Select-String PackageName | Select-String Microsoft.Paint | ForEach-Object {$_.Line.Split(':')[1].Trim()} | ForEach-Object { dism /Online /Remove-ProvisionedAppxPackage /PackageName:$_}
dism /Online /Get-ProvisionedAppxPackages | Select-String PackageName | Select-String Microsoft.People | ForEach-Object {$_.Line.Split(':')[1].Trim()} | ForEach-Object { dism /Online /Remove-ProvisionedAppxPackage /PackageName:$_}
dism /Online /Get-ProvisionedAppxPackages | Select-String PackageName | Select-String Microsoft.PowerAutomateDesktop | ForEach-Object {$_.Line.Split(':')[1].Trim()} | ForEach-Object { dism /Online /Remove-ProvisionedAppxPackage /PackageName:$_}
dism /Online /Get-ProvisionedAppxPackages | Select-String PackageName | Select-String Microsoft.SecHealthUI | ForEach-Object {$_.Line.Split(':')[1].Trim()} | ForEach-Object { dism /Online /Remove-ProvisionedAppxPackage /PackageName:$_}
dism /Online /Get-ProvisionedAppxPackages | Select-String PackageName | Select-String Microsoft.Todos | ForEach-Object {$_.Line.Split(':')[1].Trim()} | ForEach-Object { dism /Online /Remove-ProvisionedAppxPackage /PackageName:$_}
dism /Online /Get-ProvisionedAppxPackages | Select-String PackageName | Select-String Microsoft.Windows.Photos | ForEach-Object {$_.Line.Split(':')[1].Trim()} | ForEach-Object { dism /Online /Remove-ProvisionedAppxPackage /PackageName:$_}
dism /Online /Get-ProvisionedAppxPackages | Select-String PackageName | Select-String Microsoft.WindowsAlarms | ForEach-Object {$_.Line.Split(':')[1].Trim()} | ForEach-Object { dism /Online /Remove-ProvisionedAppxPackage /PackageName:$_}
dism /Online /Get-ProvisionedAppxPackages | Select-String PackageName | Select-String Microsoft.WindowsCalculator | ForEach-Object {$_.Line.Split(':')[1].Trim()} | ForEach-Object { dism /Online /Remove-ProvisionedAppxPackage /PackageName:$_}
dism /Online /Get-ProvisionedAppxPackages | Select-String PackageName | Select-String Microsoft.WindowsCamera | ForEach-Object {$_.Line.Split(':')[1].Trim()} | ForEach-Object { dism /Online /Remove-ProvisionedAppxPackage /PackageName:$_}
dism /Online /Get-ProvisionedAppxPackages | Select-String PackageName | Select-String microsoft.windowscommunicationsapps | ForEach-Object {$_.Line.Split(':')[1].Trim()} | ForEach-Object { dism /Online /Remove-ProvisionedAppxPackage /PackageName:$_}
dism /Online /Get-ProvisionedAppxPackages | Select-String PackageName | Select-String Microsoft.WindowsFeedbackHub | ForEach-Object {$_.Line.Split(':')[1].Trim()} | ForEach-Object { dism /Online /Remove-ProvisionedAppxPackage /PackageName:$_}
dism /Online /Get-ProvisionedAppxPackages | Select-String PackageName | Select-String Microsoft.WindowsMaps | ForEach-Object {$_.Line.Split(':')[1].Trim()} | ForEach-Object { dism /Online /Remove-ProvisionedAppxPackage /PackageName:$_}
dism /Online /Get-ProvisionedAppxPackages | Select-String PackageName | Select-String Microsoft.Xbox.TCUI | ForEach-Object {$_.Line.Split(':')[1].Trim()} | ForEach-Object { dism /Online /Remove-ProvisionedAppxPackage /PackageName:$_}
dism /Online /Get-ProvisionedAppxPackages | Select-String PackageName | Select-String Microsoft.XboxGameOverlay | ForEach-Object {$_.Line.Split(':')[1].Trim()} | ForEach-Object { dism /Online /Remove-ProvisionedAppxPackage /PackageName:$_}
dism /Online /Get-ProvisionedAppxPackages | Select-String PackageName | Select-String Microsoft.XboxGamingOverlay | ForEach-Object {$_.Line.Split(':')[1].Trim()} | ForEach-Object { dism /Online /Remove-ProvisionedAppxPackage /PackageName:$_}
dism /Online /Get-ProvisionedAppxPackages | Select-String PackageName | Select-String Microsoft.XboxIdentityProvider | ForEach-Object {$_.Line.Split(':')[1].Trim()} | ForEach-Object { dism /Online /Remove-ProvisionedAppxPackage /PackageName:$_}
dism /Online /Get-ProvisionedAppxPackages | Select-String PackageName | Select-String Microsoft.XboxSpeechToTextOverlay | ForEach-Object {$_.Line.Split(':')[1].Trim()} | ForEach-Object { dism /Online /Remove-ProvisionedAppxPackage /PackageName:$_}
dism /Online /Get-ProvisionedAppxPackages | Select-String PackageName | Select-String Microsoft.YourPhone | ForEach-Object {$_.Line.Split(':')[1].Trim()} | ForEach-Object { dism /Online /Remove-ProvisionedAppxPackage /PackageName:$_}
dism /Online /Get-ProvisionedAppxPackages | Select-String PackageName | Select-String Microsoft.ZuneMusic | ForEach-Object {$_.Line.Split(':')[1].Trim()} | ForEach-Object { dism /Online /Remove-ProvisionedAppxPackage /PackageName:$_}
dism /Online /Get-ProvisionedAppxPackages | Select-String PackageName | Select-String Microsoft.ZuneVideo | ForEach-Object {$_.Line.Split(':')[1].Trim()} | ForEach-Object { dism /Online /Remove-ProvisionedAppxPackage /PackageName:$_}
dism /Online /Get-ProvisionedAppxPackages | Select-String PackageName | Select-String MicrosoftCorporationII.QuickAssist | ForEach-Object {$_.Line.Split(':')[1].Trim()} | ForEach-Object { dism /Online /Remove-ProvisionedAppxPackage /PackageName:$_}
dism /Online /Get-ProvisionedAppxPackages | Select-String PackageName | Select-String MicrosoftTeams | ForEach-Object {$_.Line.Split(':')[1].Trim()} | ForEach-Object { dism /Online /Remove-ProvisionedAppxPackage /PackageName:$_}
dism /Online /Get-ProvisionedAppxPackages | Select-String PackageName | Select-String MicrosoftWindows.Client.WebExperience | ForEach-Object {$_.Line.Split(':')[1].Trim()} | ForEach-Object { dism /Online /Remove-ProvisionedAppxPackage /PackageName:$_}
