# Import Custom Modules
import json
import subprocess

from models.models import Process
from utils.LogHandler import LogHandler
from utils.ShellHandler import ShellHandler

# Initialize Custom Objects
log = LogHandler()
run = ShellHandler()


# Core Logic Defination
def StoreBloatRemover(bypassPkgNameList=[]):

    log.SectionHeading("Remove MS-Store Bloatware")

    getPkgListProcess: Process = run.powershell(
        "Get-AppxPackage | Select-Object Name, PackageFullName | ConvertTo-Json"
    )
    InstalledAppList: dict = json.loads(getPkgListProcess.stdout)

    for pkg in InstalledAppList:
        if pkg["Name"] in bypassPkgNameList:
            log.amber("SKIPPED", pkg["Name"])
        else:
            removePkgProcess: Process = run.powershell(
                f'Remove-AppxPackage -Package "{ pkg["PackageFullName"] }"'
            )

            if removePkgProcess.returnCode == 0:
                log.green("REMOVED", pkg["Name"])

            else:
                log.red("FAILED ", pkg["Name"])
