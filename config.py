from pathlib import Path
import os


def _load_dotenv_file(env_path: Path) -> None:
    if not env_path.exists():
        return

    for raw_line in env_path.read_text().splitlines():
        line = raw_line.strip()
        if not line or line.startswith("#") or "=" not in line:
            continue

        key, value = line.split("=", 1)
        key = key.strip()
        value = value.strip().strip('"').strip("'")
        if key and key not in os.environ:
            os.environ[key] = value


# Load .env from repo root if present
_load_dotenv_file(Path(__file__).parent / ".env")

GANACHE_URL = os.getenv('GANACHE_URL', 'http://127.0.0.1:7545')
CONTRACT_ADDRESS = os.getenv('CONTRACT_ADDRESS', '')

def get_checksummed_address(web3):
    if not CONTRACT_ADDRESS:
        return ''
    try:
        return web3.to_checksum_address(CONTRACT_ADDRESS)
    except Exception:
        return CONTRACT_ADDRESS
