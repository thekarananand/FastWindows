Set-Service -Name 'AppVClient' -StartupType Disabled                        # Disabled App-V Client for virtualized applications.
Set-Service -Name 'AssignedAccessManagerSvc' -StartupType Disabled          # Disables the Assigned Access Manager Service, which restrict users to running specific applications.
Set-Service -Name 'DiagTrack' -StartupType Disabled                         # Disables the Diagnostic and Usage Tracking service
Set-Service -Name 'DialogBlockingService' -StartupType Disabled             # Disables the Dialog Blocking Service, which prevents dialog boxes from appearing when you are playing games or watching videos in full screen mode. Solve your Errors not hide them
Set-Service -Name 'NetTcpPortSharing' -StartupType Disabled                 # Disables the Net.TCP Port Sharing service, which allows multiple applications to share the same TCP/IP port. Security Vulnerability.
Set-Service -Name 'RemoteAccess' -StartupType Disabled                      # Disables the Remote Access service. Security Vulnerability.
Set-Service -Name 'RemoteRegistry' -StartupType Disabled                    # Disables the Remote Registry service. Security Vulnerability.
Set-Service -Name 'UevAgentService' -StartupType Disabled                   # Disables the User Experience Virtualization (UEV) Agent Service, which allows you to synchronize your user settings between different computers.
Set-Service -Name 'shpamsvc' -StartupType Disabled                          # Disables preloading frequently used applications and files into memory
# Set-Service -Name 'ssh-agent' -StartupType Disabled
Set-Service -Name 'tzautoupdate' -StartupType Disabled                      # Disables the Telemetry and Compatibility Assistant (TACO) Auto-Update service
Set-Service -Name 'uhssvc' -StartupType Disabled                            # Disables the User Health Service