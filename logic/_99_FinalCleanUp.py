# Import Custom Modules
from models.models import Process
from utils.LogHandler import LogHandler
from utils.ShellHandler import ShellHandler

# Initialize Custom Objects
log = LogHandler()
run = ShellHandler()

def FinalCleanUp():

    log.SectionHeading("Final CleanUp")

    # Reload User's Defaults
    log.amber(">>>", "Reloading User's Defaults...")
    run.powershell(
        "Rundll32.exe user32.dll, UpdatePerUserSystemParameters"
    )

    # Trigger Windows Explorer's Restart
    log.amber(">>>", "Triggering Windows Explorer's Restart...")
    run.powershell(
        "taskkill /f /im explorer.exe"
    )
    run.powershell(
        "Start-Process explorer.exe"
    )
