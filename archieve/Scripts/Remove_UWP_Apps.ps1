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


)

dism /Online /Get-ProvisionedAppxPackages | Select-String PackageName | ForEach-Object {
    $packageName = $_.Line.Split(':')[1].Trim()
    $appxName = $packageName.Split('_')[0]

    if ($packagesToSkip -contains $appxName) {
            Write-Output "Skipped    : $appxName"
    }
    else {
        try {
            dism /Online /Remove-ProvisionedAppxPackage /PackageName:$packageName | Out-Null
            Get-AppxPackage -allusers $appxName | Remove-AppxPackage | Out-Null
            Write-Output "Removed    : $appxName"
        } catch {
            Write-Output "Error      : $appxName"
        }
    }
}
