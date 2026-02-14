import json
from pathlib import Path


class DataHandler:
    def read(self, path):
        path = Path(path)

        try:
            if not path.exists():
                raise FileNotFoundError(f"File not found: {path}")

            if path.suffix.lower() != ".json":
                raise ValueError("File is not a JSON file")

            with path.open("r", encoding="utf-8") as f:
                return json.load(f)

        except json.JSONDecodeError as e:
            raise ValueError(f"Invalid JSON format: {e}") from e

        except Exception as e:
            raise RuntimeError(f"Failed to read JSON file: {e}") from e
