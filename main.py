# Import Logic Modules
from logic._01_StoreBloatRemover import StoreBloatRemover
from logic._02_InstallWingetApps import InstallWingetApps

# Import Custom Modules
from utils.DataHandler import DataHandler

# Initialize Custom Objects
data = DataHandler()

# Main Block
def main():
    StoreBloatRemover(
        bypassPkgNameList=data.read("./data/BypassStoreAppRemoval.json")
    )

    InstallWingetApps(
        pkgIds=data.read("./data/InstallWingetApps.json")
    )

main()
