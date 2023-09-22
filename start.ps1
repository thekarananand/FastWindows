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

