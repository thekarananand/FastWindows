# Import Custom Modules
from logic._01_StoreBloatRemover import StoreBloatRemover
from utils.DataHandler import DataHandler
from utils.LogHandler import LogHandler

# Initialize Custom Objects
log = LogHandler()
data = DataHandler()

# Main Block
StoreBloatRemover(
    bypassPkgNameList=data.read("./data/BypassStoreAppRemoval.json")
)
