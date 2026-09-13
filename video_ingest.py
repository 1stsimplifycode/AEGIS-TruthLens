"""
Ingests financial video/audio clips (task #3) and enforces the naming
convention Adishree specified:

    Stockname_timestamp_source.mp4

e.g.  RELIANCE_20260913T143000Z_CNBCTV18.mp4

This script doesn't download video itself (sources vary too much - YouTube,
broadcaster archives, etc.) - it takes a clip you've already saved anywhere,
validates/renames it into the convention, moves it into data/video_clips/,
and logs it to the catalogue. Keeps the messy "how did I get this file" part
separate from the "is it correctly catalogued" part.

Usage:
    python video_ingest.py <path_to_clip> --ticker RELIANCE --timestamp 2026-09-13T14:30:00Z --source CNBCTV18
"""

import argparse
import re
import shutil
import sys
from pathlib import Path
from datetime import datetime, timezone

sys.path.insert(0, str(Path(__file__).parent))
from catalogue_db import add_entry, init_db  # noqa: E402

CLIPS_DIR = Path(__file__).parent.parent / "data" / "video_clips"


def to_compact_ts(ts: str) -> str:
    """Normalize any ISO-ish timestamp into YYYYMMDDTHHMMSSZ for filenames."""
    dt = datetime.fromisoformat(ts.replace("Z", "+00:00"))
    dt = dt.astimezone(timezone.utc)
    return dt.strftime("%Y%m%dT%H%M%SZ")


def ingest_clip(src_path: str, ticker: str, timestamp: str, source: str,
                 company_name: str = None, sector: str = None, is_audio: bool = False):
    src = Path(src_path)
    if not src.exists():
        raise FileNotFoundError(src_path)

    ext = src.suffix.lstrip(".")
    compact_ts = to_compact_ts(timestamp)
    safe_source = re.sub(r"[^a-zA-Z0-9]+", "", source)
    filename = f"{ticker.upper()}_{compact_ts}_{safe_source}.{ext}"

    CLIPS_DIR.mkdir(parents=True, exist_ok=True)
    dest = CLIPS_DIR / filename
    shutil.copy2(src, dest)

    add_entry(
        ticker=ticker,
        modality="audio" if is_audio else "video",
        source=source,
        company_name=company_name,
        sector=sector,
        file_path=str(dest.relative_to(CLIPS_DIR.parent.parent)),
        event_timestamp=timestamp,
        publication_timestamp=timestamp,
    )
    print(f"Ingested -> {dest}")
    return dest


if __name__ == "__main__":
    init_db()
    parser = argparse.ArgumentParser(description="Ingest a video/audio clip with correct naming.")
    parser.add_argument("src_path", help="Path to the source clip file")
    parser.add_argument("--ticker", required=True)
    parser.add_argument("--timestamp", required=True, help="ISO 8601, e.g. 2026-09-13T14:30:00Z")
    parser.add_argument("--source", required=True, help="e.g. CNBCTV18, ETNow")
    parser.add_argument("--audio", action="store_true", help="Flag if this is audio-only")
    args = parser.parse_args()

    ingest_clip(args.src_path, args.ticker, args.timestamp, args.source, is_audio=args.audio)
