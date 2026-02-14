class Process:
    def __init__(self, returnCode, stdout, stderr):
        self.returnCode = returnCode
        self.stdout = stdout
        self.stderr = stderr

    def is_success(self):
        return True if self.returnCode == 0 else False
