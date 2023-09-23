# Check for Admin Privileges

$Admin = ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")

if (-not $Admin) {
    Write-Host "Please run the script as an administrator."
    $null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
    Exit
}

# Remove Appx Packages apps 
irm https://raw.githubusercontent.com/thekarananand/FastWindows/main/Stage1_RemoveAppxPackages.ps1 | iex

# Remove Win32 apps 
irm https://raw.githubusercontent.com/thekarananand/FastWindows/main/Stage2_RemoveWin32Apps.ps1 | iex

# Install New Apps 
irm https://raw.githubusercontent.com/thekarananand/FastWindows/main/Stage3_InstallNewApps.ps1 | iex

# Remove Optional Features & Capabilities
irm https://raw.githubusercontent.com/thekarananand/FastWindows/main/Stage4_RemoveOptionalFeatures.ps1 | iex

# Regedit Tweaks
irm https://raw.githubusercontent.com/thekarananand/FastWindows/main/Stage5_RegeditTweaks.ps1 | iex

Stop-Process -Name "explorer" -Force
Start-Process "explorer"

echo "`nDONE........"
Pause

Exit
