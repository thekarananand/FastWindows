# Disabled Services

Set-Service -Name 'wlidsvc' -StartupType Disabled                           # Windows Live ID service
Set-Service -Name 'wlpasvc' -StartupType Disabled                           # Windows Live Authentication service
Set-Service -Name 'wmiApSrv' -StartupType Disabled                          # WMI Application Server service, Provides a remote interface for managing and monitoring Windows computers
Set-Service -Name 'workfolderssvc' -StartupType Disabled                    # Work Folders service
Set-Service -Name 'AppVClient' -StartupType Disabled                        # App-V Client for virtualized apps.
Set-Service -Name 'AssignedAccessManagerSvc' -StartupType Disabled          # Assigned Access Manager Service, Manage Restriction for specified users to running specific apps.
Set-Service -Name 'DiagTrack' -StartupType Disabled                         # Diagnostic and Usage Tracking service
Set-Service -Name 'DialogBlockingService' -StartupType Disabled             # Dialog Blocking Service, Prevents dialog boxes from appearing while playing games or watching videos in full screen mode. Solve your Errors not hide them
Set-Service -Name 'NetTcpPortSharing' -StartupType Disabled                 # Net.TCP Port Sharing service, which allows multiple applications to share the same TCP/IP port. Security Vulnerability.
Set-Service -Name 'RemoteAccess' -StartupType Disabled                      # Remote Access service. Security Vulnerability.
Set-Service -Name 'RemoteRegistry' -StartupType Disabled                    # Remote Registry service. Security Vulnerability.
Set-Service -Name 'UevAgentService' -StartupType Disabled                   # User Experience Virtualization (UEV) Agent Service, which allows you to synchronize your user settings between different computers.
Set-Service -Name 'shpamsvc' -StartupType Disabled                          # Preloading frequently used applications and files into memory
Set-Service -Name 'tzautoupdate' -StartupType Disabled                      # Telemetry and Compatibility Assistant (TACO) Auto-Update service
Set-Service -Name 'uhssvc' -StartupType Disabled                            # User Health Service



# Xbox Services
Set-Service -Name 'XblAuthManager' -StartupType Disabled
Set-Service -Name 'XblGameSave' -StartupType Disabled
Set-Service -Name 'XboxGipSvc' -StartupType Disabled
Set-Service -Name 'XboxNetApiSvc' -StartupType Disabled



# Services Disabled on boot, will start on invoking
Set-Service -Name 'ssh-agent' -StartupType Manual                           # ssh-agent
Set-Service -Name 'wuauserv' -StartupType Manual                            # Windows Update service



# Seem Essential
# Set-Service -Name 'wscsvc' -StartupType Manual                            # Windows Search service
# Set-Service -Name 'wudfsvc' -StartupType Manual                           # Windows Defender service
# Set-Service -Name 'wisvc' -StartupType Manual                             # Windows Installer service