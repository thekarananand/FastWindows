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
    "Microsoft.SecHealthUI",
)

$database = @(
    "Microsoft.MSPaint",                                                # Paint 3D
    "Microsoft.549981C3F5F10",
    "Microsoft.BingWeather",
    "Microsoft.GetHelp",
    "Microsoft.Getstarted",
    "Microsoft.Microsoft3DViewer",
    "Microsoft.MicrosoftEdge.Stable",
    "Microsoft.MicrosoftOfficeHub",
    "Microsoft.MicrosoftSolitaireCollection",
    "Microsoft.MicrosoftStickyNotes",
    "Microsoft.MixedReality.Portal",
    "Microsoft.Office.OneNote",
    "Microsoft.People",
    "Microsoft.SkypeApp",
    "Microsoft.Wallet",
    "Microsoft.Windows.Photos",
    "Microsoft.WindowsAlarms",
    "Microsoft.WindowsCalculator",
    "Microsoft.WindowsCamera",
    "microsoft.windowscommunicationsapps",
    "Microsoft.WindowsFeedbackHub",
    "Microsoft.WindowsMaps",
    "Microsoft.WindowsSoundRecorder",
    "Microsoft.Xbox.TCUI",
    "Microsoft.XboxApp",
    "Microsoft.XboxGameOverlay",
    "Microsoft.XboxGamingOverlay",
    "Microsoft.XboxIdentityProvider",
    "Microsoft.XboxSpeechToTextOverlay",
    "Microsoft.YourPhone",
    "Microsoft.ZuneMusic",
    "Microsoft.ZuneVideo"
)

dism /Online /Get-ProvisionedAppxPackages | Select-String PackageName | ForEach-Object {
    $packageName = $_.Line.Split(':')[1].Trim()
    $appxName = $packageName.Split('_')[0]
    
    if (-not ($packagesToSkip -contains $appxName)) {
        try {
            dism /Online /Remove-ProvisionedAppxPackage /PackageName:$packageName | Out-Null
            Get-AppxPackage -allusers $appxName | Remove-AppxPackage | Out-Null

            if (-not ($database -contains  $appxName)) {
                Write-Host "Removed   : $appxName"
            } 
        } catch {
            Write-Host "Error     : $appxName"
        }
    }
}

# to check for Appx packages in the Image :
# dism /Online /Get-ProvisionedAppxPackages | Select-String PackageName | ForEach-Object {$_.Line.Split(':')[1].Trim()}

# to check for Appx packages installed :
# Get-AppxPackage -allusers