Write-Host "Stage 1 : REMOVING STORE PACKAGES"
Write-Host "=========================================================`n"

$packagesToSkip = @(
    "Microsoft.DesktopAppInstaller_2022.310.2333.0_neutral_~_8wekyb3d8bbwe",
    "Microsoft.HEIFImageExtension_1.0.43012.0_x64__8wekyb3d8bbwe",
    "Microsoft.HEVCVideoExtension_1.0.50361.0_x64__8wekyb3d8bbwe",
    "Microsoft.RawImageExtension_2.1.30391.0_neutral_~_8wekyb3d8bbwe",
    "Microsoft.ScreenSketch_2022.2201.12.0_neutral_~_8wekyb3d8bbwe",
    "Microsoft.StorePurchaseApp_12008.1001.113.0_neutral_~_8wekyb3d8bbwe",
    "Microsoft.VCLibs.140.00_14.0.30704.0_x64__8wekyb3d8bbwe",
    "Microsoft.VP9VideoExtensions_1.0.50901.0_x64__8wekyb3d8bbwe",
    "Microsoft.WebMediaExtensions_1.0.42192.0_neutral_~_8wekyb3d8bbwe",
    "Microsoft.WebpImageExtension_1.0.42351.0_x64__8wekyb3d8bbwe",
    "Microsoft.WindowsNotepad_11.2112.32.0_neutral_~_8wekyb3d8bbwe",
    "Microsoft.WindowsStore_22204.1400.4.0_neutral_~_8wekyb3d8bbwe",
    "Microsoft.WindowsTerminal_3001.12.10983.0_neutral_~_8wekyb3d8bbwe",
    "Microsoft.SecHealthUI_1000.22621.1.0_x64__8wekyb3d8bbwe"
)

dism /Online /Get-ProvisionedAppxPackages | Select-String PackageName | ForEach-Object {
    $packageName = $_.Line.Split(':')[1].Trim()
    $appxName = $packageName.Split('_')[0]
    
    if ($packagesToSkip -contains $packageName) {
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