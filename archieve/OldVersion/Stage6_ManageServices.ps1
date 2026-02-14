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
    'XboxNetApiSvc'                      # Xbox Services
)

foreach ($Service in $Services_to_Disable) {
    try {
        Set-Service -Nam e $Service -StartupType Disabled
        Write-Host "Disabled  : $Service"
    }
    catch {
        Write-Host "Error     : $Service"
    }
}

$Services_to_Manual = @(
    'ssh-agent',                         # ssh-agent
    'wuauserv',                          # Windows Update service
    'vmicrdv',                           # Virtual Machine Communication Service
    'vmicshutdown',                      # Virtual Machine Shutdown Service
    'vmictimesync',                      # Virtual Machine Time Synchronization Service
    'vmicvmsession',                     # Virtual Machine Session Service
    'vmicvss',                           # Virtual Machine Volume Shadow Copy Service
    'vmvss',                             # Virtual Machine Volume Shadow Copy Requester Service
    'vm3dservice',                       # Virtual Machine 3D Service
    'vmicguestinterface',                # Virtual Machine Integration Components Guest Interface service
    'vmicheartbeat',                     # Virtual Machine Integration Components Heartbeat service
    'vmickvpexchange',                   # Virtual Machine Integration Components Key Value Pair Exchange service
    'wbengine',                          # Windows Backup and Restore Engine
    'wcncsvc',                           # Windows Connection Manager Service
    'wercplsupport',                     # Windows Error Reporting Client Protocol Support Service
    'ALG',                               # Translate Network Traffic between different protocols
    'AppIDSvc',                          # Identity & Manage permissions of Windows Store apps
    'AppMgmt',                           # Manage the Installation, Uninstallation, & updates of Windows Store apps
    'AppXSvc',                           # Manage the Installation, Uninstallation, & updates of Windows Store apps
    'AppReadiness',                      # Compatibility for the installation of Windows Store apps 
    'Appinfo',                           # Provide Information about Windows Store apps
    'svsvc',                             # Superfetch service, preloads frequently used files and applications into memory
    'swprv',                             # Virtual Memory service, "SWAP"
    'upnphost',                          # Universal Plug and Play Host service
    'vds'                                # Virtual Disk Service
)
 
foreach ($Service in $Services_to_Manual) {
    try {  
        Set-Service -Name $Service -StartupType Manual
        Write-Host "Manual    : $Service"
    }
    catch {
        Write-Host "Error     : $Service"
    }
}

# Seem Essential
# Set-Service -Name 'wscsvc' -StartupType Manual                            # Windows Search service
# Set-Service -Name 'wudfsvc' -StartupType Manual                           # Windows Defender service
# Set-Service -Name 'wisvc' -StartupType Manual                             # Windows Installer service
# Set-Service -Name 'AudioEndpointBuilder' -StartupType Automatic           # Windows Audio Endpoint Service
# Set-Service -Name 'AudioSrv' -StartupType Automatic                       # Windows Audio Endpoint Service
# Set-Service -Name 'tiledatamodelsvc' -StartupType Automatic               # Tile Data Model Server service
