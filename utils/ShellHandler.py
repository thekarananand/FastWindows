import subprocess

from models.models import Process


class ShellHandler:
    def powershell(self, command):
        try:
            result = subprocess.run(
                ["powershell", "-Command", command], capture_output=True, text=True
            )

            return Process(
                returnCode=result.returncode, stdout=result.stdout, stderr=result.stderr
            )

        except FileNotFoundError:
            return Process(
                returnCode=127, stdout="", stderr="PowerShell executable not found"
            )
