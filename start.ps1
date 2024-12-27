# Check for Admin Privileges

$Admin = ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole] "Administrator")

if (-not $Admin) {
    Write-Host "Please run the script as an administrator."
    $null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
    Exit
}

# Define the base URL
$baseURL = "https://raw.githubusercontent.com/thekarananand/FastWindows/main/Scripts/"

# Define the script names
$scripts = @(
    "Regedit_Tweaks.ps1",
    "Remove_WindowsWidgets.ps1",
    "Remove_OneDrive.ps1",
    "Remove_UWP_Apps.ps1"
)

# Loop through each script name and execute it
foreach ($script in $scripts) {
    $url = "$baseURL$script"
    Write-Output "========================================================="
    Write-Output "Executing : $script"
    Write-Output "========================================================="
    irm $url | iex
    Write-Output " "
}

New-Item -Path "$env:USERPROFILE\Desktop\Execution_Completed.txt" -ItemType File
Exit