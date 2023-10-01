Write-Host "`nStage 7 : MANAGING SERVICES"
Write-Host "========================================================="


$Services_to_Disable = @(
    'wlidsvc',                           # Windows Live ID service
    'wlpasvc',                           # Windows Live Authentication service
    'wmiApSrv',                          # WMI Application Server service, Provides a remote interface for managing and monitoring Windows computers
    'workfolderssvc',                    # Work Folders service
    'AppVClient',                        # App-V Client for virtualized apps.
    'AssignedAccessManagerSvc',          # Assigned Access Manager Service, Manage Restriction for specified users to running specific apps.
    'DiagTrack',                         # Diagnostic and Usage Tracking service
    'DialogBlockingService',             # Dialog Blocking Service, Prevents dialog boxes from appearing while playing games or watching videos in full screen mode. Solve your Errors not hide them
    'NetTcpPortSharing',                 # Net.TCP Port Sharing service, which allows multiple applications to share the same TCP/IP port. Security Vulnerability.
    'RemoteAccess',                      # Remote Access service. Security Vulnerability.
    'RemoteRegistry',                    # Remote Registry service. Security Vulnerability.
    'UevAgentService',                   # User Experience Virtualization (UEV) Agent Service, which allows you to synchronize your user settings between different computers.
    'shpamsvc',                          # Preloading frequently used applications and files into memory
    'tzautoupdate',                      # Telemetry and Compatibility Assistant (TACO) Auto-Update service
    'uhssvc',                            # User Health Service
    'XblAuthManager',                    # Xbox Services
    'XblGameSave',                       # Xbox Services
    'XboxGipSvc',                        # Xbox Services
    'XboxNetApiSvc',                     # Xbox Services
)

foreach ($Service in $Services_to_Disable) {
    Set-Service -Name $Service -StartupType Disabled
    Write-Host "Disabled  : $Service"
}

$Services_to_Manual = @(
    'ssh-agent',                         # ssh-agent
    'wuauserv',                          # Windows Update service
)

foreach ($Service in $Services_to_Manual) {
    Set-Service -Name $Service -StartupType Manual
    Write-Host "Manual    : $Service"
}

# Seem Essential
# Set-Service -Name 'wscsvc' -StartupType Manual                            # Windows Search service
# Set-Service -Name 'wudfsvc' -StartupType Manual                           # Windows Defender service
# Set-Service -Name 'wisvc' -StartupType Manual                             # Windows Installer service