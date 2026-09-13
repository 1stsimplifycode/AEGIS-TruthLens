"""
Master multimodal source catalogue for AEGIS-Market data ingestion.

This is the single source of truth mapping: source <-> stock <-> timestamp <-> modality.
Every other collector (OHLCV, news, video) writes an entry here after saving its
actual payload, so the catalogue always reflects what's on disk.

Kept deliberately separate from the 16-module pipeline (data ingestion should be
swappable without touching downstream modules).
"""

import sqlite3
from pathlib import Path
from datetime import datetime, timezone

DB_PATH = Path(__file__).parent.parent / "data" / "catalogue" / "master_catalogue.db"

SCHEMA = """
CREATE TABLE IF NOT EXISTS catalogue (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    ticker TEXT NOT NULL,
    company_name TEXT,
    sector TEXT,
    modality TEXT NOT NULL CHECK(modality IN ('ohlcv', 'news_text', 'video', 'audio', 'corporate_event', 'index_event')),
    source TEXT NOT NULL,              -- e.g. 'nsepython', 'moneycontrol', 'CNBC-TV18'
    file_path TEXT,                    -- relative path to the stored artifact, if any
    event_timestamp TEXT,              -- when the underlying event/data occurred (ISO 8601)
    publication_timestamp TEXT,        -- when the source published it (ISO 8601) - required for text/audio per task list
    collected_at TEXT NOT NULL,        -- when we ingested it (ISO 8601)
    linked_index_or_sector TEXT,       -- for index/sector-wide events affecting multiple stocks
    notes TEXT
);

CREATE INDEX IF NOT EXISTS idx_ticker ON catalogue(ticker);
CREATE INDEX IF NOT EXISTS idx_modality ON catalogue(modality);
CREATE INDEX IF NOT EXISTS idx_event_ts ON catalogue(event_timestamp);
"""


def get_conn():
    DB_PATH.parent.mkdir(parents=True, exist_ok=True)
    conn = sqlite3.connect(DB_PATH)
    conn.execute("PRAGMA foreign_keys = ON")
    return conn


def init_db():
    conn = get_conn()
    conn.executescript(SCHEMA)
    conn.commit()
    conn.close()
    print(f"Catalogue initialized at {DB_PATH}")


def add_entry(
    ticker: str,
    modality: str,
    source: str,
    company_name: str = None,
    sector: str = None,
    file_path: str = None,
    event_timestamp: str = None,
    publication_timestamp: str = None,
    linked_index_or_sector: str = None,
    notes: str = None,
):
    """Insert one catalogue row. Call this from every collector after saving data."""
    conn = get_conn()
    conn.execute(
        """INSERT INTO catalogue
        (ticker, company_name, sector, modality, source, file_path,
         event_timestamp, publication_timestamp, collected_at,
         linked_index_or_sector, notes)
        VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)""",
        (
            ticker.upper(),
            company_name,
            sector,
            modality,
            source,
            file_path,
            event_timestamp,
            publication_timestamp,
            datetime.now(timezone.utc).isoformat(),
            linked_index_or_sector,
            notes,
        ),
    )
    conn.commit()
    conn.close()


def query_by_ticker(ticker: str):
    conn = get_conn()
    rows = conn.execute(
        "SELECT * FROM catalogue WHERE ticker = ? ORDER BY event_timestamp", (ticker.upper(),)
    ).fetchall()
    conn.close()
    return rows


def coverage_summary():
    """Quick sanity check: how much data do we have per modality per ticker."""
    conn = get_conn()
    rows = conn.execute(
        """SELECT ticker, modality, COUNT(*) as n
           FROM catalogue GROUP BY ticker, modality ORDER BY ticker, modality"""
    ).fetchall()
    conn.close()
    return rows


if __name__ == "__main__":
    init_db()
    print("Schema ready. Import add_entry() from your collectors.")
