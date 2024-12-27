Write-Host "`nStage 1 : REMOVING STORE PACKAGES"
Write-Host "========================================================="

$packagesToSkip = @(
    # Useful Microsoft Crap
    "Microsoft.DesktopAppInstaller",
    "Microsoft.ScreenSketch",
    "Microsoft.WindowsNotepad",
    "Microsoft.WindowsStore",
    "Microsoft.Services.Store.Engagement",
    "Microsoft.StorePurchaseApp",
    "Microsoft.WindowsTerminal",
    "Microsoft.SecHealthUI",
    "Microsoft.WindowsCamera",
    "Microsoft.WindowsSoundRecorder",
    "Microsoft.Windows.Photos"

    # Media Encoder
    "Microsoft.VP9VideoExtensions",
    "Microsoft.WebMediaExtensions",
    "Microsoft.WebpImageExtension",
    "Microsoft.HEIFImageExtension",
    "Microsoft.HEVCVideoExtension",
    "Microsoft.RawImageExtension",
    "Microsoft.VCLibs.140.00",

    # Hardware Vendor Apps
    "RealtekSemiconductorCorp.RealtekAudioControl",
    "AppUp.IntelGraphicsExperience",
    "AppUp.ThunderboltControlCenter",
    "DTSInc.DTSAudioProcessing",
    "ElevocTechnologyCo.Ltd.ElevocSmartMicrophoneSettin"

    # ===================================================================
    # 📌 Your Device may include various Vendor Apps.
    #    To identify these apps, you can use one of the following methods:
    #
    #    1️⃣  Retrieve all installed AppX packages:
    #        Get-AppxPackage -allusers * | Select-Object Name
    #
    #    2️⃣  Check provisioned AppX packages:
    #        dism /Online /Get-ProvisionedAppxPackages | Select-String PackageName
    #
    # 🚀 Feel free to contribute by submitting your vendor app details via a PR!
    # ===================================================================

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