Write-Host "`nStage 1 : REMOVING STORE PACKAGES"
Write-Host "========================================================="

$packagesToSkip = @(
    "Microsoft.DesktopAppInstaller",
    "Microsoft.HEIFImageExtension",
    "Microsoft.HEVCVideoExtension",
    "Microsoft.RawImageExtension",
    "Microsoft.ScreenSketch",
    "Microsoft.VCLibs.140.00",
    "Microsoft.VP9VideoExtensions",
    "Microsoft.WebMediaExtensions",
    "Microsoft.WebpImageExtension",
    "Microsoft.WindowsNotepad",
    "Microsoft.WindowsStore",
    "Microsoft.Services.Store.Engagement",
    "Microsoft.StorePurchaseApp",
    "Microsoft.WindowsTerminal",
    "Microsoft.SecHealthUI"
)

dism /Online /Get-ProvisionedAppxPackages | Select-String PackageName | ForEach-Object {
    $packageName = $_.Line.Split(':')[1].Trim()
    $appxName = $packageName.Split('_')[0]
    
    if ($packagesToSkip -contains $appxName) {
            Write-Host "Skipped   : $packageName"
    }
    else {
        try {
            dism /Online /Remove-ProvisionedAppxPackage /PackageName:$packageName | Out-Null
            Get-AppxPackage -allusers $appxName | Remove-AppxPackage | Out-Null
            Write-Host "Removed   : $packageName"

        } catch {
            Write-Host "Error     : $packageName"
        }
    }
}

# to check for Appx packages in the Image :
# dism /Online /Get-ProvisionedAppxPackages | Select-String PackageName | ForEach-Object {$_.Line.Split(':')[1].Trim()}

# to check for Appx packages installed :
# Get-AppxPackage -allusers