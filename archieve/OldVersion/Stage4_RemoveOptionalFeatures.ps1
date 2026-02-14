Write-Host "`nStage 4 : REMOVED OPTIONAL FEATURES"
Write-Host "========================================================="

$Packages = @(
    "InternetExplorer",
    "Windows-Kernel-LA57",
    "MediaPlayer"
    "Wallpaper-Content-Extended",
    "TabletPCMath",
    "LanguageFeatures-Handwriting",
    "LanguageFeatures-OCR",
    "LanguageFeatures-Speech",
    "LanguageFeatures-TextToSpeech"
)

foreach ($Package in $Packages) {
    DISM /Online /Get-Packages | Select-String "Package Identity" | Select-String $Package | ForEach-Object {
        $packageName = $_.Line.Split(':')[1].Trim()
        try {
            DISM /Online /Remove-Package /NoRestart /PackageName:$packageName | Out-Null
            Write-Host "Removed   : $packageName"
        } catch {
            Write-Host "Error     : $packageName"
        }
    }
}

$Capabilities = @(
    "WMIC",
    "Windows.Kernel.LA57",
    "OneCoreUAP.OneSync",
    "Microsoft.Windows.WordPad",
    "Microsoft.Windows.PowerShell.ISE",
    "Microsoft.Windows.Notepad.System",
    "Microsoft.Wallpapers.Extended",
    "WindowsMediaPlayer",
    "MathRecognizer",
    "Language.TextToSpeech",
    "Language.Speech",
    "Language.OCR",
    "Language.Handwriting",
    "DirectX",
    "InternetExplorer",
    "App.StepsRecorder"
)

foreach ($Capability in $Capabilities) {

    DISM /Online /Get-Capabilities | Select-String "Capability Identity" | Select-String $Capability | ForEach-Object {
        $capabilityName = $_.Line.Split(':')[1].Trim()
        try {
            DISM /Online /Remove-Capability /NoRestart /CapabilityName:$capabilityName | Out-Null
            Write-Host "Removed   : $capabilityName"
        } catch {
            Write-Host "Error     : $capabilityName"
        }
    }
}
