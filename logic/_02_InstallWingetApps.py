# Import Custom Modules
from models.models import Process
from utils.LogHandler import LogHandler
from utils.ShellHandler import ShellHandler

# Initialize Custom Objects
log = LogHandler()
run = ShellHandler()

# Core Logic Defination
def InstallWingetApps(pkgIds=[]):

    log.SectionHeading("Install Apps from Winget")

    for pkgId in pkgIds:
        installPkgProcess: Process = run.powershell(
            f'winget install -s winget --id {pkgId}'
        )
        if installPkgProcess.returnCode == 0:
            log.green("INSTALLED", pkgId)

        else:
            log.red("FAILED   ", pkgId)
