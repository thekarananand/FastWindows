# Check for Admin Privileges

$Admin = ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")

if (-not $Admin) {
    Write-Host "Please run the script as an administrator."
    $null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
    Exit
}

irm https://raw.githubusercontent.com/thekarananand/FastWindows/main/NewScript/Regedit_Tweaks.ps1 | iex

irm https://raw.githubusercontent.com/thekarananand/FastWindows/main/NewScript/Remove_OneDrive.ps1 | iex

irm https://raw.githubusercontent.com/thekarananand/FastWindows/main/NewScript/Remove_UWP_Apps.ps1 | iex

irm https://raw.githubusercontent.com/thekarananand/FastWindows/main/NewScript/Remove_WindowsWidgets.ps1 | iex

New-Item -Path "$env:USERPROFILE\Desktop\Execution_Completed.txt" -ItemType File

Exit